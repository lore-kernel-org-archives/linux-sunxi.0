Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385F3201
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 22:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771E0C385A7;
	Sun, 24 Apr 2022 22:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650839422;
	bh=hYFLXl6wWtoTzWaTkcL5ZGI7jII5VVhw0xu5nDplZN8=;
	h=Date:From:To:Cc:Subject:From;
	b=XtlLlS+EcTSwRF2UkB7iNNOJQjLZOrq+wzM4pnPCudfsdmjLuM5Mq0bH1sXyRXHCT
	 FWmVOzEqrZLMrHnCkturZ8r9izhrv1y8m62Gx/9EYG18AsKWbrgb/RPBbuvP3dS3A/
	 +OPRdl/FRwAWxk10z9ZduJfcKOnI7RjDYlSNcnHt6fkeWuP06D/7F4WLzWbKMc4Y0Z
	 Gza+UfMFm6XrhrbeGVVjuWkelmkuX/SdAwauNUciAXbWhIw1b8K2Xd1kUDz4pS+Qmw
	 z9z/bq9igxUc7ZoigywSCjWZIq2N5DvtrZXfN8HW1PIk6qN3353mUQqZ0PZhif1doC
	 lRQI6yPRXYKLg==
Date: Mon, 25 Apr 2022 00:30:18 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock fixes for 4.18
Message-ID: <YmXPemmFqfcj4p/p@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following changes for current release.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-5.18-1

for you to fetch changes up to b4f3d5f06e29b7020f19cc788b2c2de750e888a1:

  clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical (2022-04-24 23:22:46 +0200)

----------------------------------------------------------------
Two clock fixes:
- missing sentinel in device id array
- missing critical flag for rtc-32k clock

----------------------------------------------------------------
Samuel Holland (1):
      clk: sunxi-ng: sun6i-rtc: Mark rtc-32k as critical

Wan Jiabing (1):
      clk: sunxi-ng: fix not NULL terminated coccicheck error

 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 2 ++
 1 file changed, 2 insertions(+)
