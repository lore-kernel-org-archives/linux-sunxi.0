Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3F2FB2
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Jun 2021 08:55:24 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o33-20020a05600c5121b02901e360c98c08so8202625wms.5
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Jun 2021 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ptTxiGNRR9tLNMxRNvuOfTEawaDh7PBZAwJYDWExn6A=;
        b=WXZPto5hzmyq5c5odNy0McigPUrb1U8D3ElSea0YA6x/fugujmRnICRwcXvzB0modn
         RFnxjMlR5rE8gEr/sN5IsPfVueKZ85sDhJDqHVQdokVO1mBkU5H75gAJjv02f5wgE+hn
         9LbJ/Lux2MkBxb4hmXxfyM2A54N/Inefn2dzazJZSSLXMuZel802aLRLHm61C95k4Knf
         Qzq1O1q8UbX4z+Di3lo98MSoo9TmKjBJp0IDDBkY80mplsdN197X8ah2DRZiZXdVKiON
         Ys/9hFDExx35ZaHsv4nZKEgcmZoYISMbZ7YT3aQ1MdLsDQFfdmlLJG04Z4poXicy4dGf
         XV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ptTxiGNRR9tLNMxRNvuOfTEawaDh7PBZAwJYDWExn6A=;
        b=tAWLDPQioKUTLUWvXh927ba0mmD7HBGZzDM3YyP+/R3St+9xrhZECYAA24QRASCCBG
         FxqGNdvsinrS4kG5Mp7f6MVv1FGNyVndrTzktOmot32NnabfBqJpp9u6Bq1YdkCjQoLT
         KcEe/Xb5Xw18j+WpCLTnraWOXDEhHLcrwunb7GpyFF9fH0bhOohiRsoi/CeqaH8tBWe4
         p4NUUUrc9Hpp7+Tf9F5CeK3T+OeKVrVDctMRF+622Iq1b/Hj0c4Jh9isYlpjMESNH//a
         0x9Stf+3tWVJPqZNptWUMO/yR2laSFkuQx8hrjYafSW/MIRGJhX+e6rTyZcOiewM2/7P
         w3lA==
X-Gm-Message-State: AOAM532qwEiTaFtLKX0sX1Ak5LTb+6/g/phZlfRc+DFzTJxGZXkMvbm9
	wSSwMcTwaqPkcgDIE9lf9cM=
X-Google-Smtp-Source: ABdhPJw6/VYXiHMo3tYPsIdCX2Czl9c8v5+Wa4nye0fP9/XfYl++WvluOveXRSNeUl+JlD1lODFXkg==
X-Received: by 2002:a05:600c:2243:: with SMTP id a3mr15630087wmm.86.1624697723317;
        Sat, 26 Jun 2021 01:55:23 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
        by smtp.gmail.com with ESMTPSA id n8sm7967502wrt.95.2021.06.26.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 01:55:22 -0700 (PDT)
Date: Sat, 26 Jun 2021 09:55:13 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
	christian.koenig@amd.com, Xinhui.Pan@amd.com,
	james.qian.wang@arm.com, liviu.dudau@arm.com,
	mihail.atanassov@arm.com, brian.starkey@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	inki.dae@samsung.com, jy0922.shim@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
	tiantao6@hisilicon.com, john.stultz@linaro.org,
	kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
	laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
	p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
	tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
	yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
	linux-graphics-maintainer@vmware.com, zackr@vmware.com,
	hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
	michal.simek@xilinx.com, jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com, linux@armlinux.org.uk,
	kieran.bingham+renesas@ideasonboard.com,
	rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 24/27] drm/vkms: Don't set struct
 drm_device.irq_enabled
Message-ID: <20210626085513.akf4cwyqpbchmycf@smtp.gmail.com>
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-25-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210625082222.3845-25-tzimmermann@suse.de>

On 06/25, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in vkms.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've also checked here, lgtm.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 027ffe759440..496de38ad983 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -163,8 +163,6 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
> =20
> -	vkms_device->drm.irq_enabled =3D true;
> -
>  	ret =3D drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> --=20
> 2.32.0
>=20
