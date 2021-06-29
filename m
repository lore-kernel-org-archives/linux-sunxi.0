Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D16517F
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Jun 2021 15:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DB6161D94
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Jun 2021 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624982387;
	bh=mApRLgk69+mMV6V2Jp0Hts8X9JoUe+4WPGnamh9oiBU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=jn/UYtxd6DOT82xj4Jn5ozrIOU1lYCBRLr3TmBNuywthA+if1knOf6CycPUljm3dn
	 qrjGs6Lu1J28zcL8aopJN6s5OgAz8oLAytGSTEQG1DzNQPPf3gRaYpVpMxeLaaiOyh
	 bVLemkmvbDMqQhIQKL1xV/Q0bjnonDenCYi8Nolx6I+32TCDLTuouRZokZI1drVfJE
	 rJ0FGqtMN7GMe63abKwOLeIESoem7LfaZWgx2r5f3S3BCSvyUtxwGLzfmuIrRVi5Ux
	 miLI4IVM6blF+0nBNxbMjbmWsAsTFPSHxCiyoRO2xhOx2NgTOob6j1ZWe0xWsOAKXd
	 Tr8eWN67R/h5g==
Received: by mail-lf1-f41.google.com with SMTP id t17so40414083lfq.0
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Jun 2021 08:59:47 -0700 (PDT)
X-Gm-Message-State: AOAM533GPwZX+JJzZahOrMZtBPzLLCR7KUWkJ3XofS1jdiNMVRB1Eav1
	9SjCK8WoJMIN4F1jcGi4yVDM/YFWbVN1+zwzbjo=
X-Google-Smtp-Source: ABdhPJxbKRPGstVIg+10tcjtk+VnYZ+lj9b97iwRcHVe57pqV9+t3IECtbTnQC+RnmS+mFeMuInfdc2gJTFJGcCpAlk=
X-Received: by 2002:a19:e210:: with SMTP id z16mr1316558lfg.233.1624982385490;
 Tue, 29 Jun 2021 08:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210629135833.22679-1-tzimmermann@suse.de>
In-Reply-To: <20210629135833.22679-1-tzimmermann@suse.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 29 Jun 2021 23:59:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66wYxs7u1AubriRokPFh72ZONMxGgmGNPB5mFLOZNw_3Q@mail.gmail.com>
Message-ID: <CAGb2v66wYxs7u1AubriRokPFh72ZONMxGgmGNPB5mFLOZNw_3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/aperture: Pass DRM driver structure instead of driver name
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, airlied@redhat.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, spice-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, virtualization@lists.linux-foundation.org, 
	linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 9:58 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Print the name of the DRM driver when taking over fbdev devices. Makes
> the output to dmesg more consistent. Note that the driver name is only
> used for printing a string to the kernel log. No UAPI is affected by this
> change.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-

Acked-by: Chen-Yu Tsai <wens@csie.org>
