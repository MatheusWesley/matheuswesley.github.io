import { useState, useEffect } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faGithub } from "@fortawesome/free-brands-svg-icons";

interface Repository {
  name: string;
  html_url: string;
  description: string;
}

interface GroupedRepos {
  [key: string]: Repository[];
}

export function RepoList() {
  const [repos, setRepos] = useState<GroupedRepos>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchRepositories();
  }, []);

  const fetchRepositories = async () => {
    try {
      setLoading(true);
      const response = await fetch(
        "https://api.github.com/users/MatheusWesley/repos",
      );
      if (!response.ok) throw new Error("Failed to fetch repositories");

      const data: Repository[] = await response.json();

      const grouped = data.reduce((acc: GroupedRepos, repo) => {
        const firstLetter = repo.name[0].toUpperCase();
        if (!acc[firstLetter]) {
          acc[firstLetter] = [];
        }
        acc[firstLetter].push(repo);
        return acc;
      }, {});

      const sortedGrouped = Object.keys(grouped)
        .sort()
        .reduce((acc: GroupedRepos, key) => {
          acc[key] = grouped[key].sort((a, b) => a.name.localeCompare(b.name));
          return acc;
        }, {});

      setRepos(sortedGrouped);
    } catch (error) {
      setError(error instanceof Error ? error.message : "An error occurred");
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <div className="loading">Carregando repositórios...</div>;
  if (error) return <div className="error">Erro: {error}</div>;

  return (
    <div className="repo-grid">
      {Object.entries(repos).map(([letter, letterRepos]) => (
        <div key={letter} className="letter-group">
          <h3>{letter}</h3>
          <div className="repo-cards">
            {letterRepos.map((repo) => (
              <a
                key={repo.name}
                href={repo.html_url}
                target="_blank"
                rel="noopener noreferrer"
                className="repo-card"
              >
                <FontAwesomeIcon icon={faGithub} className="repo-icon" />
                <h4>{repo.name}</h4>
                {repo.description && <p>{repo.description}</p>}
              </a>
            ))}
          </div>
        </div>
      ))}
    </div>
  );
}
