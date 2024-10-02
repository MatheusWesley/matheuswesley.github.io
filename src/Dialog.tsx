import React, { createContext, useContext, useEffect, useRef } from "react";

interface DialogContextType {
  isOpen: boolean;
  setIsOpen: (isOpen: boolean) => void;
}

const DialogContext = createContext<DialogContextType | undefined>(undefined);

interface DialogProps {
  children: React.ReactNode;
}

export function Dialog({ children }: DialogProps) {
  const [isOpen, setIsOpen] = React.useState(false);

  return (
    <DialogContext.Provider value={{ isOpen, setIsOpen }}>
      {children}
    </DialogContext.Provider>
  );
}

interface DialogTriggerProps {
  children: React.ReactNode;
}

export function DialogTrigger({ children }: DialogTriggerProps) {
  const context = useContext(DialogContext);
  if (!context) throw new Error("DialogTrigger must be used within Dialog");

  return React.cloneElement(children as React.ReactElement, {
    onClick: () => context.setIsOpen(true),
  });
}

interface DialogContentProps {
  children: React.ReactNode;
}

export function DialogContent({ children }: DialogContentProps) {
  const context = useContext(DialogContext);
  const overlayRef = useRef<HTMLDivElement>(null);

  if (!context) throw new Error("DialogContent must be used within Dialog");

  useEffect(() => {
    if (!context.isOpen) return;

    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        context.setIsOpen(false);
      }
    };

    document.addEventListener("keydown", handleEscape);
    return () => document.removeEventListener("keydown", handleEscape);
  }, [context]);

  const handleOverlayClick = (e: React.MouseEvent) => {
    if (e.target === overlayRef.current) {
      context.setIsOpen(false);
    }
  };

  if (!context.isOpen) return null;

  return (
    <div
      ref={overlayRef}
      className="dialog-overlay"
      onClick={handleOverlayClick}
    >
      <div className="dialog-content">{children}</div>
    </div>
  );
}
