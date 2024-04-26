Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC192B9AF
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714149839; cv=none; b=Hq3stnWQ64kZaP4S7V7GvIfHVHqI/f9vcyGrC9OCEYkpl5Nd5YMKvOZXq9N1waS8HZM+4VzEnBA9RJjTgsfUQbALJzbcrAt3+ERFP7+J/hy1BC6ArArBhbliT5oD9/DGlynClUEV3m0boSonhMGls/g8iilMZNzpm1z3EwsLW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714149839; c=relaxed/simple;
	bh=J03uKQoHQpVCaMRRkCpW8xUCxGu4+2Me52A8K2pCfI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nk+9dkcmSFkr9lcO1vNKCwH3tzBa0CISe/UUzQ+TRmsiskig0yOOb5+RcrDGe4e7y2j1zP3YCbt7+Mhge4jey1g5UEGvKzbckfwEcOZFX+EdKe20HAqKrMGjTlft27/uakCpNR8Fnu46O0JrBKuOzm+hM/lFkkRjlJgdO7oymZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXCBceym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXCBceym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A047C113CD;
	Fri, 26 Apr 2024 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714149838;
	bh=J03uKQoHQpVCaMRRkCpW8xUCxGu4+2Me52A8K2pCfI8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=rXCBceym8U8ZgeiN+hsom48YjctqEJWisGgA+09G4rOWns+By7W3TcJa2D03wneDy
	 HeAVh8OqY8ayqf5JxnEI12eNXtLc8WZwsKqpl4qcATa8HT/h3MYT+opdYqXs/eu1dq
	 hKnJNc3H9PDHcQnGz/HQmSg2ORKeHcFWzQos+AYAhzCaYymUKx/XpbpoMJtez2CyUU
	 oqXdhaGdKBco06K/b65Tqrf0oOkxnChyFe6sZe38wly8SsEnubnpuvU52lbArUW5Dw
	 M4yf16IlS/W+WI2X64BYwyR5aVWOxVeWlxtjWl6fdzi49NSIR8w9PCx6V7y7eGFmwF
	 tikDh11XCtSQA==
Date: Fri, 26 Apr 2024 18:43:54 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner config changes for 6.10
Message-ID: <20240426164354.GA101098@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following config changes for 6.10.

Best regards,
Jernej

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config-for-6.10-1

for you to fetch changes up to deff401b14e2d832b25b55862ad6c73378fe034e:

  ARM: configs: sunxi: Enable DRM_DW_HDMI (2024-04-15 23:32:39 +0200)

----------------------------------------------------------------
- add dependency for DRM_SUN8I_DW_HDMI in sunxi defconfig

----------------------------------------------------------------
Maxime Ripard (1):
      ARM: configs: sunxi: Enable DRM_DW_HDMI

 arch/arm/configs/sunxi_defconfig | 1 +
 1 file changed, 1 insertion(+)
