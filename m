Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652E3232
	for <linux-sunxi@lists.linux.dev>; Fri, 13 May 2022 11:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E23C34115;
	Fri, 13 May 2022 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652442317;
	bh=gSlTC6iZU0FLdcrVnrtY1LCfhwmVPu9LQ1rXCiM6BFA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0NE0ToQbT13hKkluuP7B9Ln6n7hQ60+c09MaSbjwpTs2R5295FFkfpUBvUZzuZrb
	 s29RFMrueTuGebu36ZcJjLW3a8dRRx26GI5ybWUisMWqvSckD5kB/yChN02T+acq2O
	 KdCno+g1cfyj6DzVkxOI1rQcvSEVGSkiWZ5mzj2lNjvkHF3WIA3rDBbQ/ye+nlV2Um
	 vzyby3mgK0F//VrhtKmI0kDq4Jb+9BQ/uOLPl6ammehav7QJKQ22ElR6ExTfw4JbLP
	 1zNaUf8NxAseYy6gHejCSWxc/FhABrgSuMEnBNNXfjCJ8KEE1PD936iSJ3JYkACBzj
	 +G70YvYvSh8mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	wens@csie.org
Subject: Re: [GIT PULL] Allwinner DT changes for 5.19, take 2
Date: Fri, 13 May 2022 13:43:37 +0200
Message-Id: <165244216372.2862916.14976486899085014388.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <Yngton59OacOR2ht@kista.localdomain>
References: <Yngton59OacOR2ht@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 8 May 2022 22:52:50 +0200, Jernej Skrabec wrote:
> Please pull following DT changes for 5.19.
> 
> Best regards,
> Jernej
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 41f0bbd621e9df72f970962465b3a267ddfeaf53

       Arnd
