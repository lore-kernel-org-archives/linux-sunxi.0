Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955A3F5BF5
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814841; cv=none; b=DV9qao37WhNZ56Je5Go36KN/tEY38xo3AL+x2XLKvd8g2xvMGWUUFl9GBOwq5izFGKk5C2Yi2NdjK6dTErUlhwqa+GSV/Zym9zZGC9M7VwuIajXrxuyBDvJ8RQU0DqBXLHHG0bmLMuQ2zGIAhHZ5I0Cx+7qsDsCZSKdoAD53KOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814841; c=relaxed/simple;
	bh=6vlTEbLpE12ceadHYuYXD2yQXepskLTOdTdXoYCyhfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=atpbMC1QInX6nguO9mF5ahepux/PSoEKnVGbqZJA60VW3EpAO0wRuX5DwlfT8Tw4+YsGyqm/0kuL8KB0I8DgBnV8WUzY0PTsCv5j5vS+aJs1WKIxFjhaVM7rVFs0G2dMqDOaiQnt2GQjQ1hwcxzu4L6Le1XARImJg3+1n8bO0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqqS48gW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqqS48gW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8E41F00A3A;
	Tue, 26 May 2026 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814840;
	bh=ynS33XbPn5UTJVuOQCAbtdFNSrBjdFso4C4toIwoOM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TqqS48gWX4UIQddMJxu4gkEf3OtYzgKn0DPKW+XHQLRgzSCkV1MXpSKdUiyKnGy77
	 IYmb3JoY/FDe/47oADywd67+kNWvYxvy7SfejXO6IJ7UyYKT2P0pAPGfpLkr3DL4wL
	 bZ7RqsMHfYnocDkYJ8RPhQ7/+2i1dDTWl8UBlAqxTdnbPNAqTssvnCacIe/w1jDrqG
	 p77FDeWgPSNqvEmp0WpiVYO1iPBBCYma9sfDA0SGTxDNJXgcGckXir0YdVbKtEGXzj
	 XlkJ98L4dW6Ys1OSV2sBw7w68znnMu9ABR8PsxU8OYu8UMKAealYkWpvfvYNPgowiT
	 ZytjJANLOEE8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/19] drm/atomic: Document atomic commit lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260526-drm-mode-config-init-v6-1-852346394200@kernel.org>
References: <20260526-drm-mode-config-init-v6-1-852346394200@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 17:00:39 +0000
Message-Id: <20260526170039.EF8E41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in documentation: 'refererence' instead of 'reference'.
--

commit 68dc91b6affb075e72fa412fac45ff103b6f970a
Author: Maxime Ripard <mripard@kernel.org>

drm/atomic: Document atomic commit lifetime

This commit documents the lifetime and memory management of drm_atomic_comm=
it
and its associated state structures.

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 170de30c28ae4..3c5714481ad28 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
[ ... ]
> @@ -47,6 +47,78 @@
[ ... ]
> +   + Once done, and when the last refererence to our &struct
> +     drm_atomic_commit is given up through drm_atomic_commit_put(), it

[Severity: Low]
This isn't a bug, but there appears to be a typo here ("refererence" instead
of "reference").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-drm-mode-c=
onfig-init-v6-0-852346394200@kernel.org?part=3D1
