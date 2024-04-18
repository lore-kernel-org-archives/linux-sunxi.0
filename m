Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220F15DBBB
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441105; cv=none; b=SXOq8ieZ4C0mSmg3n6StKJmBdnxqP+vBrG46ATuf2amnRT8M1fDS+7SDQX9AVS6ZUkzgtWx+Tw1b7a4l7G1nTk1Ug19bUx2YaUCaQdENRYu3d3Y/LpnTgAXRwXTQ91k4kC8VwUBdq1ZptyZAogVvrR6ZLBtBPgkAr/ZQupYSvEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441105; c=relaxed/simple;
	bh=kKCBekfE4dBm8z1f/Jm+KxsNndEKb4bU3RKDH6Hjj6g=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=NenlM6OovCncrr814XSCaOvYlJp/eFX+K6xxB/ij/HrIzR5Rzyk7IgIuGwE8rrtXlftyKgmIH0qycqTwOPp3kn6Ukb8CRpdjpA3KW41E7Wel39eDXxFn7ffQRji8jOZETwE5vs2FfEUWYkAUveJUYPJ1DqW4P6hsT5NDKnO8zZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rffD6A7o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rffD6A7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8425BC113CC;
	Thu, 18 Apr 2024 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713441105;
	bh=kKCBekfE4dBm8z1f/Jm+KxsNndEKb4bU3RKDH6Hjj6g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rffD6A7ofnfKBlgVlvRl2XWBz+IYAt333b6i5WV2mHAc+C9cWVR/YhwKwJW7lNLxT
	 /10+eZ9/CTsp2RhHOiiEe7C21o2C9NA1rrV8J1a+BvmFyymtrzKoUE4rzUWp7p5f2d
	 LRfiJ2wfXunXljxkJVo7Ct1t1Lfy0hGN8yPRMcL+ouvyVuXVbvw+XTuFl7IhtYbPkt
	 yLtsboXmBh8UDiAjo3IWSk96/Io/0p9jnsL8AMASFNHIJrA5DXP47SB35RMCGwAPNA
	 hmtHRkIz2ouSec+Nmw6GrDsHmOi3kH8T8N8IRS5xghrJDljT+digmP2HqL/xmLUptG
	 nrWfbSRy6JfOg==
Message-ID: <aa328a01f193821ea324bb00248e03ce@kernel.org>
Date: Thu, 18 Apr 2024 11:51:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 06/15] drm/sun4i: hdmi: switch to struct drm_edid
In-Reply-To: <0967dde8ae35cd58ab8ea58397d514bb9df29fd1.1713273659.git.jani.nikula@intel.com>
References: <0967dde8ae35cd58ab8ea58397d514bb9df29fd1.1713273659.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Chen-Yu
 Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Samuel Holland" <samuel@sholland.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Tue, 16 Apr 2024 16:22:20 +0300, Jani Nikula wrote:
> Prefer struct drm_edid based functions over struct edid.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
