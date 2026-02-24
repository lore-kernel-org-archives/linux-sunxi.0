Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D432C235E
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Feb 2026 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956353; cv=none; b=awB6rp6+TkYa7toGFEDs9Piw/CMHKr0OXTCBKl7111G98MpruhY26qdGMXxXUC7Pl6aD60zZA11iosZaWwa56UuzxTyCxMaOkGIq/3PeRtNmiNgNLJCSu9/8U/EFXSZ+P8gvFtVvb/DYIbSzeC1bJ2M0vfyGUXuNNctzyEINeNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956353; c=relaxed/simple;
	bh=oDA6UJNQcyFpalFPlNTdTB6nBaNvITv3rMdDCBmeZT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qrlfvtogJCl/bWOvhw8oeSI/1CDE7nHlfcMjeo0defvDEhHqdSL6Z6grGg6Rr2OlqzOzeyiQoGBpMb9PpmdlRqA0F0jyJb36K+9IugFYmY7Ngz3sqeg1HmyLO9hcvjl/bM15XVdsUnkUvSE39B9V5VgZPL06xTDJbEjngKHcgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Are0fmoV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Are0fmoV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72029C116D0;
	Tue, 24 Feb 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771956352;
	bh=oDA6UJNQcyFpalFPlNTdTB6nBaNvITv3rMdDCBmeZT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Are0fmoVRYQ/dX/iYZMCs437W5x1/OPW6XfOpHTZ1rS700kv5dBVpZqFYFf5RH6CF
	 V2a19cvi+jHmuriX2gxHcDJ+G7cgVmyjBSqTx83LjdSaF23mWk9VFXBamFy7lfogFO
	 ao3ifCXPhN/UJGVneJ0CPKg15X//bg9lSBCGL1jSfjYqE6ZJT5hWfpc5wFNJPwbJQm
	 9u+yDrEIbP9yB68F1+hWzDo5kTfPMuhK1qmdwSWMHoskltWXJgDT3IaxZf9Xf/oKhg
	 J9gsYLJBhEXVKsthXe4W/3QW2NGeF2Wve1ZjmNwx6BXEkevARe8pADxXFogQ6NUxbv
	 lYBJfEMZRdfyg==
From: Chen-Yu Tsai <wens@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20260219215524.468142-1-rdunlap@infradead.org>
References: <20260219215524.468142-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] drm/sun4i: fix kernel-doc warnings in
 sunxi_engine.h
Message-Id: <177195635023.133983.103201374012158795.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 02:05:50 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 19 Feb 2026 13:55:24 -0800, Randy Dunlap wrote:
> Correct the kernel-doc notation, add a missing struct member comment,
> and add a missing "Returns:" function comment to eliminate kernel-doc
> warnings:
> 
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
>  kernel-doc format: * @mode_set
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set'
>  not described in 'sunxi_engine_ops'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
>  not described in 'sunxi_engine'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
>  for return value of 'sunxi_engine_layers_init'
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
      commit: 645186bf86932c6b9deed2e564cffd09576ba9a4

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

