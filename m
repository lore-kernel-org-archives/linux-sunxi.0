Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAB110F5
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 07:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303E8C433C8;
	Mon,  4 Sep 2023 07:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693814309;
	bh=pKUbMJ7O8Os+Ar2FZmAgeHqSU7CTw0TYRCnkJDIg7I0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=LDjgR2toWSyxM6eaNf5MclGQkx8j8Rs9pbSyMxrEwR3b7inYlQ1n2Gzk5SRTcP1/4
	 LjJiylmv2BkNCopbGUdOtGxoLEN4vrn9lqUKG9V0taLDeu3PqxiDdWu8nyFZ1Y7kqv
	 /iAt1WXEzE7UMIKIx8gaI91nDPNgUln6bX79+pmOgaOyDYjSRRyoaJj5wu4CAlJRaC
	 esUVjTO5ScwUV2thH+4kor1+Br+0yl4w0tczWPI/YBxVxc0zTQfka7Ote4t0asnQGm
	 1PT9bT54FwQeUHtbuVe3D+4h7pelxn2r2/TfunUWt+zGq4Ix1UD7O8KKZQWtj+d+xc
	 MeKI0z7FqL8eg==
Message-ID: <37ab52defccfc95d726451853227bd91.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:58:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
In-Reply-To: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
References: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
Cc: airlied@gmail.com, airlied@redhat.com, alain.volmat@foss.st.com, alexander.deucher@amd.com, alexandre.belloni@bootlin.com, alison.wang@nxp.com, bbrezillon@kernel.org, christian.koenig@amd.com, claudiu.beznea@microchip.com, daniel@ffwll.ch, drawat.floss@gmail.com, dri-devel@lists.freedesktop.org, javierm@redhat.com, jernej.skrabec@gmail.com, jfalempe@redhat.com, jstultz@google.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, liviu.dudau@arm.com, nicolas.ferre@microchip.com, paul.kocialkowski@bootlin.com, sam@ravnborg.org, samuel@sholland.org, spice-devel@lists.freedesktop.org, stefan@agner.ch, suijingfeng@loongson.cn, sumit.semwal@linaro.org, tiantao6@hisilicon.com, tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, virtualization@lists.linux-foundation.org, wens@csie.org, xinliang.liu@linaro.org, yongqin.liu@linaro.org, 
 zackr@vmware.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

On Fri, 1 Sep 2023 16:39:53 -0700, Douglas Anderson wrote:
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
