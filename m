Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79872C80
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Oct 2021 14:44:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04653610A1;
	Wed, 20 Oct 2021 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741055;
	bh=y+PkBJkdDwyPtZbZaFNFm5XmnIabiJnkg8sO5+l1eZA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PEbBj09g25OZMVlqoLmkGQexel8my6YfCSwsMkvnzG3awC6iXh4MfL4uyHcI0B58Q
	 y++sdOLQeLzUhIAtUpa+HTaFa+izbIWoXFxIz35KeFJo2UmpS7IMl9ED6J1gG6UmAt
	 y0ZRRzwK7HnXd+Uk73XuJeq5ua1t+TSf9mhQGDci5V/6eXXJnvOWoRqELMUEOrAwjZ
	 55mMEjlIgHe6d7ne1210Kw76gkaqI0xKX/sqXMSddo1nfyFsXqNN1OZjkE+vdTUaQ+
	 8epOBl5pdapraoEOh/32RvYAtj2U1fQHSmzDsCg8nx0Uzu4rHvayhkjqy2I6rLbCZD
	 SQJ6JNlazBmBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Fixes for 5.15
Date: Wed, 20 Oct 2021 16:44:09 +0200
Message-Id: <163474104514.3915621.2292250382784060564.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <d4c41c71-f1ff-4464-a26f-1bfd4b52fd78.lettre@localhost>
References: <d4c41c71-f1ff-4464-a26f-1bfd4b52fd78.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:01:25 +0200, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e23c7487f5a74f5cc9f7e1090f1d83c3e33ae315

       Arnd
