Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5DB21D3C0;
	Thu,  8 May 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689187; cv=none; b=svd2G3XxA5Hb6/WUBN4uL3g99nPEFdCPGScBDcJ333C8RAIMR4jUH4VvIbgmUzc8JeJnvDbIF1b8fbEEtVFvaF4WVQ32Pje0Le5GFDZ6czpBpmPQMu2C/Lrp1Ey47U3cuai31qRkE10bheGGmhWUcKRDjldr51v3ak3eB2ds9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689187; c=relaxed/simple;
	bh=lDVhoE3V2KBUKc6XkA3MZUxna2iMhYxYrxfM8q0Hm0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gD93cyBEFtw3WlCJKQOz/ASzy95c3KtO0tUNit5N4zxxhhvIwIBVPtDBjyryovP3QNJh++LhW8WYC7vX1onNI6wsi8biMBL9ut8MX3RV6Kz/CcCY9vfioVlin97XI1x+lNi2DzxdyJYsoW+gFoZ/M6gfygHF683KyjTkD9jGvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cytNPQ0V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cytNPQ0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26533C4CEEB;
	Thu,  8 May 2025 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746689186;
	bh=lDVhoE3V2KBUKc6XkA3MZUxna2iMhYxYrxfM8q0Hm0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cytNPQ0VyKQFqKkF0zNpjCyBrU/cPfvXhhlh6V3+EYdpgk0AGJKMDFRooHr6Gys6F
	 4y5cUTxbdIvf0AV+VPyHFVca+7Azp8k43cJqOUZE7J750oLYwgr2TngpFFg6N5MdBq
	 FIrkmB55/C3HDIbszl+qXOrL2szdf+LcGtLIqijM/5IBaJvK1QsFfzOAqNZvq9juIQ
	 l+8tPFmzylgsQHLW0i74lBD05UWKCpt2IGHEAaU4Y1k2ncDh9q3yjYQO+sp2zYBpmu
	 s5TMJfWF/AlAKnnG2c06/Sps4kHZ2/Dc63SJwVNUd0oVa+YK5Lua8Bi1q4+BwQ5og1
	 dfajrgZDfaBjg==
Date: Thu, 8 May 2025 09:26:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ryan@testtoast.com, macromorgan@hotmail.com, 
	p.zabel@pengutronix.de, tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, 
	simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org, samuel@sholland.org, 
	jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33)
 support
Message-ID: <20250508-foxhound-of-interesting-drizzle-34adae@kuoka>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>

On Wed, May 07, 2025 at 03:19:19PM GMT, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> I've spoken with Ryan and he agreed to let me take over this series to
> get the display engine working on the Allwinner H616. I've taken his
> previous patch series for Display Engine 3.3 and combined it with the
> LCD controller patch series. I've also fixed a few additional bugs and
> made some changes to the device tree bindings.
> 
> Changes since V8:
>  - Combined the DE33 [1] series and the LCD [2] series to better track
>    all patches necessary to output to an LCD display for the Allwinner
>    H700.

You have here three or four different subsystems. This does not make it
easier, but it makes it a huge patchbomb with unspecific or complex
base.

Such combination makes no sense, because anyway it will have to be split
per subsystem. You just know made it difficult for maintainers to review
and apply, because they cannot apply entire set.

Best regards,
Krzysztof

