import { faGithub } from "@fortawesome/free-brands-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Dialog, DialogContent, DialogTrigger } from "./Dialog";
import { RepoList } from "./RepoList";

export function App() {
  return (
    <div className="card">
      <img src="https://github.com/MatheusWesley.png" alt="Matheus Wesley" />
      <div>
        <h2>Matheus Wesley</h2>
        <h3>Full Stack Student</h3>
        <p>
          Crio apps com React e Vue, e atualmente tenho estudado muito frontend.
        </p>

        <Dialog>
          <DialogTrigger>
            <button className="repo-button">Mostrar Repositórios</button>
          </DialogTrigger>
          <DialogContent>
            <RepoList />
          </DialogContent>
        </Dialog>
      </div>
      <a
        href="https://github.com/MatheusWesley"
        target="_blank"
        className="github-icon"
      >
        <FontAwesomeIcon icon={faGithub} />
      </a>
    </div>
  );
}
