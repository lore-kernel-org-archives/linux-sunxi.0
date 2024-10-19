Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CC0173
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729350493; cv=none; b=SwmIp2MORlO7kEJQMsChstiQoaIPZdpLK9be0kPVFVzR9sis2X1YZhlkKbCiyBfyVHKsvc0u4UNYzESbJaKlIFUqMm8mKZHAegPd2OZ4ghxryWtNwbWiMEVZdvdWA5ejioS5rmFlvYCiouCaCjuGgUDk6NGFMwBu1VIkkUNiY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729350493; c=relaxed/simple;
	bh=T04Ci3DpcQvFUjPH9Q1Wr6AuQqtqxIqvEsyZQ2eL8Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvTpG62FP27Ld3DPkRGOIlLsri0hvdTRJBD95XMqauporC70+PjJDV9sZVFMmwl6vaiP69cjhu8jbklj/CJIgo1CtO+ITNASouaSyNWQeL2aYX0ht+yD1whGUVAKy5rCL3JxicvqAMJ015jTA8aYEeEy5a8H8eyH2FRc6UGZ2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f53973fdso2410508e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 08:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729350486; x=1729955286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KppUXjhEPV4r0T7yVwFFdc51/qjJ3J+VTbqN9GzY1Fk=;
        b=Fs36U0expYV0MZCqxkwAX1mQhXkvF98z5ugJ7GxtMJ5GeyQEb6OoaDvZptmvvNXMqW
         DvyS0mxDC3PxHhouJlGhZjv39nP5Kf+Q4MH/0b5Vto4C3EkzXs0mNs4b1xPxipbsH6dW
         JTyMv84KHIWa58cqAPQyuyFidHE5qJEEZfyC1c+hZakAFuIAYiS5mnvBJ3UlyHdU6lCQ
         XewC8SDHwpRym+Puq3vpzS/uVPCZ0LsQeDA575l7YGzrcqBz7R4n8xhyZxXOJeEXnrqJ
         3Povt1u7ZJiMlhY08yMP9+8uqXlAFvlGnWdkIbX5DM9w8fDjJDbmaM8BPGcag4+4+XY2
         LXsA==
X-Forwarded-Encrypted: i=1; AJvYcCUumpxsBXbwo8s+t5N8XRISqWAjEEsOCUQhqdiT6lzqJVt4LKdtS4OM3Ewar/EzTrAHMg+uHs5WnEb2QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2J3IX1Wf25VfKWr4w19INo32wL12vm5dRgxU0bPYipGyXveTD
	68cFmOnWAErdF3V7uALr7F/qJrT7WA3k3yI6AJDxeBXUvN/jIvv+KsmcaGax2rc=
X-Google-Smtp-Source: AGHT+IGVIhVg4CoejUhiQ5+b/YFN/x7MU/NdLwgGhdPJCH+ZkWkNvfUhN/xZjIEZFoeWRc7cJj59SA==
X-Received: by 2002:a05:6512:2316:b0:539:f51d:8273 with SMTP id 2adb3069b0e04-53a0c6a56d0mr3640998e87.1.1729350486370;
        Sat, 19 Oct 2024 08:08:06 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211590sm552422e87.246.2024.10.19.08.08.05
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Oct 2024 08:08:06 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5f647538so30857151fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Oct 2024 08:08:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIKwuDDcTlwNBaH7dkKm2n75T8b4nog+AOEv6JATJvaMB/Zim4xdvzxp37WV22C1y8oYrmgsL8wt+BLg==@lists.linux.dev
X-Received: by 2002:a2e:be07:0:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2fb82b82228mr21240541fa.2.1729350485763; Sat, 19 Oct 2024
 08:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 19 Oct 2024 23:07:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vRDTJtQHKiGLV73Pep2PN7LHTZMRK8k+N0cseVWL6vQ@mail.gmail.com>
Message-ID: <CAGb2v66vRDTJtQHKiGLV73Pep2PN7LHTZMRK8k+N0cseVWL6vQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 4:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Several HDMI drivers have common code pice in the .mode_valid function
> that validates RGB / 8bpc rate using the TMDS char rate callbacks.
>
> Move this code piece to the common helper and remove the need to perform
> this check manually. In case of DRM_BRIDGE_OP_HDMI bridges the check can
> be dropped in favour of performing it in drm_bridge_connector.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Makes sense, code looks like a correct substitution, and AFAICT covers
all current in tree drivers.

Whole series is

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
> Dmitry Baryshkov (6):
>       drm/display: hdmi: add generic mode_valid helper
>       drm/sun4i: use drm_hdmi_connector_mode_valid()
>       drm/vc4: use drm_hdmi_connector_mode_valid()
>       drm/display: bridge_connector: use drm_bridge_connector_mode_valid(=
)
>       drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
>       drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
>
>  drivers/gpu/drm/bridge/lontium-lt9611.c        |  4 +---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 12 +++++-------
>  drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
>  drivers/gpu/drm/display/drm_hdmi_helper.c      | 25 ++++++++++++++++++++=
+++++
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c         | 12 +-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                 |  4 +---
>  include/drm/display/drm_hdmi_helper.h          |  4 ++++
>  7 files changed, 52 insertions(+), 25 deletions(-)
> ---
> base-commit: af44b5b5776cc6ac1891393a37b1424509f07b35
> change-id: 20241018-hdmi-mode-valid-aaec4428501c
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
