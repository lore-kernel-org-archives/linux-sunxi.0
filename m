Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009271EB9F9
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249497; cv=none; b=ri3Z+dZL29HB5zdcjpx1LZJR/p/2NZgy0N2COdI+f6ZMEviqOuwHJW4JedlwvSIvvoq5BP9ihjgeIm2of5Qd77oS8tdsJt/wvNJxcpRA29kWztHr6BIwMqE7geFEqdUv1ndhB1PUOJYDQgbxbvOJ/bhY3GxF1BC+DOeATlETy44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249497; c=relaxed/simple;
	bh=n2ZgSrqVf8Xk2qny3IM696f2eGm4cHoO0kMMWIjRAo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DteNbSKhen6ocUidMntY3CTW/bIAERGkXv2sw8IgBPubsblm5bysRK1FZKOlv6ZEI7RHSix73wmsZOKBylPa3aeq6noVgpmCpRGyrhzELEpL7LjVIVRJ4/w5Bhfv/FQP86XPEp9D9bNAh5i0Lu9tSnrZ/E59CwODIQX9gbAVswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qmv8Pl1i; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qmv8Pl1i"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so2490714e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Jan 2025 03:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249493; x=1736854293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3N5s5fdL2YNf7soMuvHTeYgJ8vy52pHoEfk/tcGSD8=;
        b=Qmv8Pl1iqUdudYyDQ8HZeZhcL96hCW8m6T+g0Fb6ELkoCZxyf6qouGytkerYBGF62W
         TToL37bnwG4yESxq9Gyg6zM+Gt8ZAaE+rODoIk7C5JGLEB4Y5nuOBEYfBZCwPohukkZ0
         FhXshhxfD3N64ViJOaKgjSuw57dMNGCGMnhx6Xoo2y7NogBo9bAGzd4hkOie7RHOnd0s
         MOUFhA8nRfQNG5ANJU3vgI26rQhnl/M0DAbkUDVAaOGXeXlUOeBzL33yh8MQh2QA1ugf
         PfNqNO02vF8bvoN18tcWFZ3tR2+9NyAI+RuxLIzhCmjRoUzxyVkbBF46JTa5+1ro/2Ue
         /ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249493; x=1736854293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3N5s5fdL2YNf7soMuvHTeYgJ8vy52pHoEfk/tcGSD8=;
        b=BoWaSL0+2Mol3rI8oJ5F6rHCW4VrOlaDapexPqJVNll8bKE3c/nzA9BRyMujhs15J9
         ti7nZjLnXd6l0CseJnYGUZ0yjivK+ChNmtQH8Q9LyxYbCJmbN+TNqiOCHVOPwX5UOmP+
         TrcZPCLQWsLZHdTEvlwHYl8OuRKRtbO4fkTsDdtoOMefMwYneLeY+u+BS1EguoiqkYDN
         RbLZBlQS0qr+Xrz7p2FcrZCQWcLe2TXdAyBe/v8nhUspM3t5VlRqheHNcHep9/56cGOe
         oSmRmIfwhKiTX69peaTfsmdSMZLk2je1MuNNNbcvkKn8oisUNN70E7SamWlFYbBpfQDq
         0bog==
X-Forwarded-Encrypted: i=1; AJvYcCWe5XuRMd2TXFrz7V8A3usOKULSwgJYB4GunJHr8XTZt4L2unTdlIcGlQvgl+qyDj61eaeEfAYpS2z09w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6WSHENAJeBpajjh28kvARGvgnFVZo1pOuq/xa1TGhC0nIsxmN
	EtlVGvKqSrhZ2fJsbJ9pL6d8QKlalTQYo3zTaImANuNPrNRh8vz+cpjToFvqxX0=
X-Gm-Gg: ASbGncs5PSCrdkeuhXY2GKT20QeH3JkwloejB237WlVGTl2LndjWX+DZTosSmREbaQx
	zoKX/AedYuhUi7YfG+c6/SHet7hEfoy39gFkYjHGDOh0luPZz9QWdXjMLVzOIf2fjN7L1Z9GqGK
	PmRQDWGFQHSUjpLjdznAFoKL9NuwgwuKzpfE2xjPeoqpMu7uZp1lGA95d7fYJL9BGJqry8WMFaZ
	6gPt93Qhdv78pSJU3F4N7c/ahYE+KBoZjTDslABM3UTD0KF2/dPm40omxtpJs0Pt57iRo2PNDXo
	0YvBGNlBCxLiTsgUjtSOa5hW
X-Google-Smtp-Source: AGHT+IENf5iIM0eyUUKKI+rIQnGA5rELVSy2jGiVzJtZlwGnyitqzrPGGRO+n/bqFHmHqnjQEDg7ZA==
X-Received: by 2002:ac2:4c4c:0:b0:542:7217:361a with SMTP id 2adb3069b0e04-54272173890mr3514721e87.10.1736249493006;
        Tue, 07 Jan 2025 03:31:33 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm5169219e87.44.2025.01.07.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:31:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Ian Ray <ian.ray@ge.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept const mode pointer
Date: Tue,  7 Jan 2025 13:31:28 +0200
Message-ID: <173624946815.1500596.321177900833598022.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> While working on the generic mode_valid() implementation for the HDMI
> Connector framework I noticed that unlike other DRM objects
> drm_connector accepts non-const pointer to struct drm_display_mode,
> while obviously mode_valid() isn't expected to modify the argument.
> 
> Mass-change the DRM framework code to pass const argument to that
> callback.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/encoder_slave: make mode_valid accept const struct drm_display_mode
      commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
[2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
      commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
[3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode_idx()
      commit: 5f011b442006ccb29044263df10843de80fc0b14
[4/5] drm/connector: make mode_valid_ctx take a const struct drm_display_mode
      commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
[5/5] drm/connector: make mode_valid take a const struct drm_display_mode
      commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a

Best regards,
-- 
With best wishes
Dmitry

