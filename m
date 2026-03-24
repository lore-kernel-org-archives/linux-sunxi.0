Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC843DA7E3
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343546; cv=pass; b=Mb86pjTWdXbIL0NfG+JDZidfx6RjJmvuuelM4QhapKGJ7WTU87xnV5OJNxj0HpQVGOkPUvbItnay7VkzqucSmJ+hcSjvQMIeAdh2kIWcjHkcoVMLMu/fZu1RnKZ9zdqfda2jSDlF2HB7dd5Ng5sUpGN3FjflW/DV17EIAwx+hto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343546; c=relaxed/simple;
	bh=c8zK+r4RN9KImtcqUOa/0tFxQLr/hjJWMM5bmv9oMhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aV1DPP2fi06hhEARkktwdTtjdZseyMWQ4jafg1QLnhenIbLgI7wj1yhOEcTME6fpxebXHImHlYWRHe1cCqDH9tAdWzCFM2J/Y1e3Fqj5CQNm4xAWfweo2txfqTeVcMedTz0gP+pkyTbROPMp0596zFQVdy99N5dUvOafv62eCdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=d35X0Uta; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="d35X0Uta"
ARC-Seal: i=1; a=rsa-sha256; t=1774343500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d8MnFBQkKpHJ4TH23zDPo4o46LfLDPrpOVdPHNE8ffXdXoFxGc7Z2FEQ4wf6xDvr2cm7f+ehIE1nYTny/bZbLEgXKPGNowaLSVzidCx+RDP0QVrCp1rUpzEgSWZboLirKnaw3feRFwxKdgLPp9qDSBWOC9EQ+PdE64D0Fb72wRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774343500; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AQWLMORUnkVbiNjJGAhEshPKUTqZoxqhRKKnwPG0jLg=; 
	b=NH0ufGdazv3xhvW3Ffcl7B4X+OXgsO2OwuF9YchQH2o1qCxwFwAHLOp6Zc9AN4bYNWjkBXcO8A/Gl4hBfRmU2ZDpNdH4anSXnKBrZDzPcZvm1CE1utnQ6TUPnwdidE/PxAo/b5tjhVe35PQLV7xLoUd4trRPY7FM8r/TZMm+Zzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774343500;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=AQWLMORUnkVbiNjJGAhEshPKUTqZoxqhRKKnwPG0jLg=;
	b=d35X0UtaEM7Po2FmSfpYS/6GcdVCuoJdv3y7/qdxC4D7X6PAayQR7Kq9dY6FsyOk
	EqCn9VqIS2DDtW5r6H2IvfwLjVfCoPmKAaXUTbFOlMt00Gc2rXszoXyC6oQA7gOJ0jf
	iE+gFM6eC7gQYaMiIKr+UMRYfL2+ysQVrvP/2n1E=
Received: by mx.zohomail.com with SMTPS id 1774343497883801.6427108884712;
	Tue, 24 Mar 2026 02:11:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject:
 Re: [PATCH v3 04/14] drm/amdgpu: display: Convert to drm_output_color_format
Date: Tue, 24 Mar 2026 10:11:29 +0100
Message-ID: <7113873.lOV4Wx5bFT@workhorse>
In-Reply-To: <20260305-drm-rework-color-formats-v3-4-f3935f6db579@kernel.org>
References:
 <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-4-f3935f6db579@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 5 March 2026 10:04:56 Central European Standard Time Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a8e4e3ab5e40276b3c723297ca6520688079e0a7..2fe9044e1e91d7581fd5032b9883548f8e5e1b43 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6723,15 +6723,15 @@ static void fill_stream_properties_from_drm_display_mode(
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
>  	else if (drm_mode_is_420_also(info, mode_in)
>  			&& aconnector
>  			&& aconnector->force_yuv420_output)
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
> -	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
>  			&& aconnector
>  			&& aconnector->force_yuv422_output)
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR422;
> -	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
>  			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
>  		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
>  	else
>  		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
>  
> 
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I've been running this patch as part of my color format work and it
works precisely as it's supposed to (which is also quite evident from
the simple conversion in the code.)

Kind regards,
Nicolas Frattaroli


