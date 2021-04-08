Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855670
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Apr 2021 15:24:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3C106112F;
	Thu,  8 Apr 2021 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895495;
	bh=TLpwdhb+A3hEkJ3+J4LoBWIjpmirFUNIFnFTPkHmz80=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZXbaCPzw9oAOwPa31WJTNbiFqc9g2OHccX5WdEuT808HrTpkph3Ttwqq+pjG+zNcO
	 NQYtpZpB4TiXPftGRspN8fLWD3EGU1BOsFX9oEttsxb/xKUqVWYzwdAfrEbJWX38ZX
	 6LW6g9UhaE05qHYdTfDduBMvQngyq+CNocyl3St1BdrfeSHnVBj/rQrbNj5hZcx99Z
	 vI9BCCYbcM8v8wLaGMBltoGIjMzBzf5vO9bnsoGXGd1xrlsY4JvXTVUQ6UAr6IrPIg
	 1F14LpqV7toh8TgDCq7g+jJiwuRwIuEJi/t5i1TjvHyKBJG02j1IvjZi+OrgbnJmIv
	 TZOSPcBqMqIWQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.13
Date: Thu,  8 Apr 2021 17:24:24 +0200
Message-Id: <161789462018.1629934.16112481410782715304.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <8a3e3271-bebe-4d27-a9e7-7b7a6311a38d.lettre@localhost>
References: <8a3e3271-bebe-4d27-a9e7-7b7a6311a38d.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 2 Apr 2021 15:52:36 +0200, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 0d310a3791f6823cf5dcfec5666c1b8cfe6b149b

       Arnd
