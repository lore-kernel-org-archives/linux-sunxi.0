Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B17E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 18:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2FC385A4;
	Mon, 25 Apr 2022 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650910331;
	bh=PzFwd46naK79xo9QzYuIAbLIo5dfqEORp0tgf1bObg8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=jEfFZfeSQaaLGkYzfTamuAs3WCmAxeq56mVAvYbOP9WhYlbSbJb8NhNr31LAiItvA
	 Md7ZsW4tlDHmCGU+9V3NGCDdqquWxbWx+iVyCAHfrJxl7aqFQcRea032igfnIJ4v7Z
	 HP8sbmkeFFd/GrQSGFHY9n6dDXYXjrOxK3OJ19E9ir7HyqFKXG2WEBspkVcwiHwjet
	 31q5Bh8gGJzD50r8uyhbPDMI+MQd/UfegFG7OtZ46AEY1BiFrFXHha6lpazO66CLaH
	 Fpc9m/3jdNNQk0dzhnX/icpLd36w01OmueHC8qAqPbtNHc6jjdeGxMsK52losOqV9r
	 AN6qtsN6unFcg==
Date: Mon, 25 Apr 2022 20:12:07 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner fixes for 4.18
Message-ID: <Ymbkd+/dDmRJz66w@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following fix for current release.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-5.18-1

for you to fetch changes up to fff8c10368e64e7f8960f149375c12ca5f3b30af:

  bus: sunxi-rsb: Fix the return value of sunxi_rsb_device_create() (2022-04-25 19:29:04 +0200)

----------------------------------------------------------------
Fix return value in RSB bus driver

----------------------------------------------------------------
Christophe JAILLET (1):
      bus: sunxi-rsb: Fix the return value of sunxi_rsb_device_create()

 drivers/bus/sunxi-rsb.c | 2 ++
 1 file changed, 2 insertions(+)
