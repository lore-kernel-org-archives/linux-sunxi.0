Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D67F46A8
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Sep 2022 21:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933A7C433D6;
	Sun, 18 Sep 2022 21:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663537012;
	bh=VA0G8G77r5IqqSL1JIDo8xBS7dvTKMIOsgsqR2+Oy84=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=giX8qrN5Zhl6Lb0eI8V4oeThB8/6HBGbxfzRjl7OzagDNEzS7UU2M5pjITRMVdWAB
	 8TmyCfaipKsLot0KSYLJGHTOPtm+ybNUfYzrE5S7tryrMTkMqSS0uvBoUQjYrFOOMP
	 d3HgmeEsndR7giCB6TZo7YIY3WW3natjRk+YOOCb6XmbC9FtEmMRfvx/Yx3VRwpS5l
	 eNSQ+WPls8CJlcdDMZBCIZUNhs3NA1mQl321TE8IosphI5TsyDk/rqCJ0c7OCaUd4M
	 2rYqRug/bVPd9M/Pduu9YSJl8emv+Dmlz56StCbITE0nM+2Yvb+/Vuh1igm67rYvIV
	 BuDT6U7zzMmNQ==
Date: Sun, 18 Sep 2022 23:36:48 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner config changes for 6.1
Message-ID: <YyePcA5YHOZjdOf7@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

Please pull following config changes for 6.1.

Best regards,
Jernej

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config-for-6.1-1

for you to fetch changes up to 561044b5d6526a2a7925ccb18a073ad909ad06a1:

  arm64: defconfig: Enable devfreq cooling device (2022-09-08 22:09:50 +0200)

----------------------------------------------------------------
Enable devfreq cooling device driver in arm64 defconfig

----------------------------------------------------------------
Clément Péron (1):
      arm64: defconfig: Enable devfreq cooling device

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
