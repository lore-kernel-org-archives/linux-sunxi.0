Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB18522D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 23:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D494C433D2;
	Fri, 27 Jan 2023 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861297;
	bh=2hdWr6T/WjT5vZCKDK6aZHVDGeohJNCAOELbi8uie98=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SnVa6IInCT1j6wozNLLRtFv1ZiJFdbb1iMgq7d0g3UNwuiR3RzS+GYf9iFv5LiraA
	 FtA8wajncpE8TvIakN52ksDv2QAMwjnVczgzPE6/O7gH7bzM16SbfdMWsJW1WjFjhW
	 3TBgRgpGu6ps7n8j2hj1JG+q9Q9RWeUFkOX/Hsq4notDQ3nyVwk4WPbBZw7zVVe1l0
	 JSurwajJesL2xebjXXtH8+U5fjqinud1HcbVQawYYHrYRJlIcpu7KeFnrJE5qgdvH6
	 Jp6ko25vBirvr3ZbL2zOYcBe6BExFtRjw3LhfO2e/o8EG279TkFxqBniWj7tWpQwPY
	 wnxiOq0MKwnHQ==
Date: Sat, 28 Jan 2023 00:14:53 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner config changes for 6.3
Message-ID: <Y9Ra7dxkfMI9Xp3F@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following riscv config changes for 6.3.

Best regards,
Jernej

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config-for-6.3-1

for you to fetch changes up to eb20e7cb91ba3e5dbd94b6bfc8b9609bd5fd5770:

  riscv: defconfig: Enable the Allwinner D1 platform and drivers (2023-01-27 23:10:08 +0100)

----------------------------------------------------------------
- Enable Allwinner D1 platform and drivers

----------------------------------------------------------------
Samuel Holland (1):
      riscv: defconfig: Enable the Allwinner D1 platform and drivers

 arch/riscv/configs/defconfig | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)
