Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460C40D571;
	Mon,  6 Jul 2026 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356649; cv=none; b=idl1cVA9m6TS31nVlR/wAXhK265lMUj1Nu/vSx6eljUTZ75gnvosUhteRwFchnbPXZYeKL0MYqA+dd5Gb7rDgoT7NL4cZrbmaPvpWRLjIuGJEIzyA4QdVI9xHRSBDwsNgBCqUF16VOy+JKLYyr4toOWOiJXrh8xbwAy2k58vSws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356649; c=relaxed/simple;
	bh=xL0PtydgzURvirDcHkXmoORdj3lVwt0pgcSDZhpjEEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rLhcY6HFkUQ3cw+2175KMITkc+jiMNkVHZLCzrKEFLDgaaFobYMJP9l8NKDRSyiPyVZG2v/H0nxnyPyMsAS1gvYwuJBuwLTDv0H2pFo/ptK4E51sNm449iauCa454H6VxnC/OZdvL5YZOuFxBTtW+UN5bIjC5PllaGgHjOHyvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEJAH5pk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEJAH5pk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA7D1F000E9;
	Mon,  6 Jul 2026 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783356648;
	bh=lB8AmE01x3pOGC49SN5Hh0rNVmozdHeSscMj7Yjuhf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fEJAH5pkQVrtrZmjpQE2/wRtQhEMgTf7Try6BxbnZobHx3bGmnXsGFOuqzlbpjfZP
	 25s10dXoVM3O6DHDX1cOl2CdKlJZ03SWMxxDcEfTRANMgGFwSbTZP1sxwjRovYdH5+
	 fd9/0JKD8okhGm8mSUiNGFrCaInZTVqa1IFajI42fblPvzHxq0l+mxmdjTwTIALeYo
	 6s0gqdPfEb7BP2kqjUZpZgt2M156iLmNIAUwtb09HYZe+arLHzLxvbdOhMnrGAI0P2
	 BR0RXTjP8ryIkr3+jaMmldXbJhkpjPn1nlRpegKpUuzUoLwIayUPihfZloDAFqHRBh
	 BXH8bpEHqsayg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Diogo Silva <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Message-Id: <178335664599.3964854.35900641652179943.b4-ty@kernel.org>
Date: Tue, 07 Jul 2026 00:50:45 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 23 Jun 2026 22:34:40 +0200, Diogo Silva wrote:
> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the dependency on drm simple helpers from sun4i
> DRM drivers.
> 
> 

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: Remove dependency on DRM simple helpers
      commit: 34d85c43b6cb3abec03d6f9d8128fb28a7e2bfdf

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

