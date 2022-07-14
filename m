Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D24A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9B5C34115;
	Thu, 14 Jul 2022 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812707;
	bh=ZxGcswQ43FCtWsV6LU3deNP7wgAwCzgFNjKABgI7O3M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U2yS722PF3zeA2lq8nx3y3GfNXc0mWjtTWeF4rlDOiJO6cjb+rlaPVpDsbX3Xl7Gk
	 6JHNcAK1AKRS9M6b+UhCRIFSrNSOTaakdOtRjEnWu4VZD/Sds3bzsh3TPmW9ocfwqT
	 AMNvdQv1V2uPV3oWLXCK9o0wRxdD2xTtQ6sE5TWgL+mfPg3mMbpKlY5e7KCfrvftvJ
	 PEvSk/GaAJNlpYnF9Ca1gmiu98IkpjxhCfKuRYuDWij3+ghMgxJ16QkBjzZ9SO6ljN
	 XJ37JcrqDzpdyViwt1FXgseHgGWQ/h/WOo059ArrgHEuAAZbYDyOhXR+v0ofQj9TYN
	 m3K2fcYxD7Wfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner DT fixes for 5.19, part 2
Date: Thu, 14 Jul 2022 17:31:28 +0200
Message-Id: <165781258585.3193274.957558840404142112.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <Ysh44qUmdmF6TWS6@kista.localdomain>
References: <Ysh44qUmdmF6TWS6@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 20:35:14 +0200, Jernej Skrabec wrote:
> One DT fix came late, so here is follow up DT fixes PR for 5.19.
> 
> Best regards,
> Jernej
> 
> The following changes since commit 79471f29ec4870bc02b4fea844e86669a8a4f2a5:
> 
>   dt-bindings: display: sun4i: Fix D1 pipeline count (2022-07-04 22:41:26 +0200)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 3f231ccb38835121034a8fe09c798e57801ff4fd

       Arnd
