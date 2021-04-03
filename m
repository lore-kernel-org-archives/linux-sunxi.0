Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920DB259E
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Apr 2021 20:57:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8925661353;
	Sat,  3 Apr 2021 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617483430;
	bh=hO9/OTmLG0RXUwfVmsv9gdrqok/H5a0w/xDzWkp2i7A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZajaCon/njBo9pGm+jWQASujV40hBo+PtYAEOKd73nE+EXJCwG82gkrE+D2S1WGR5
	 acuXKICJI5a+v59tqWP3Q29a0tSrfupXJqY0PbfRQBAmmqjXFZ/GA2CHQATGHU8xx/
	 fqlpFzCqRrMiyuOz9grBOZMrhDy3IICbVx61fUNzmwKZ+EaenudgaeLhn11tmS8ze/
	 btfuWY+tHwY/mcQSvXyiWivny9jtsHhJ3Oug2SbmH3SU6QpOeJI+PfhSNjahSxQ0xV
	 l4I+qlsOYdAEhQ0A9S7NW2NoW6MuReml8h8dGKoWqKlM1XNc+hN2B2Fp/Bh9LGuzJK
	 q6ytpEhMQCnOw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.12
Date: Sat,  3 Apr 2021 22:56:57 +0200
Message-Id: <161748340980.896324.15422033544003499472.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9df637a0-945e-4469-8e6d-0903cc9d3196.lettre@localhost>
References: <9df637a0-945e-4469-8e6d-0903cc9d3196.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 2 Apr 2021 15:36:33 +0200, Maxime Ripard wrote:
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d06d82146c3b4b1159b052c6c2e143293ee9f687

       Arnd
