Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86F19F120
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745820659; cv=none; b=n6ACyrXuA0PHvI+HXVd67mTC1YsumZHWLAuToBrZm3PQTOqDkqQyoPiDL8FjuwZ++JAbI8jNZ0TDVdTSWFsdN7SfARUBEbpd7y2akM7x76M6gh/VGjC8kRDr4Xs7uN5kmeKMYTHADZoR3f1aqgWC+JkYf1pHTAvYyKYS1PhNnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745820659; c=relaxed/simple;
	bh=9Otz/d2gzrWoOePyNeKzlIpVCpLA5uOam+AtSbppq4k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W8BJ+MRxt7A3bWjpH4eCJjAokPKGoab1XmCX8ZuLlpJ3tveKFfb6tWLdYKpQVtXDH68d2h3z26BrQsc1AHj7j3hdekr1wYexCAv8BqoLqj0SuRXNusj5IyaPzOX2Bfj3gqzEnJ69G6+Abvo5BpLDNFknzvGxdyI05y5fWHwzdt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDm7ojeT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDm7ojeT"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so844286566b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745820655; x=1746425455; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QphPfE+vUE67L3trT4TGohjxqNrvuWYQckH1kmeBzLI=;
        b=DDm7ojeTEugt8DECrB1FFN+BFFN52yBy9VBaZ4Bxrvb9KyOBL7YpQTF44KyZS7S2vV
         1YCGVlmMTGMSW1EMV1IPFVbX8YxkPvD1q3NlHJv3FarqzZElQcgALtfvNZYkMfsk4Afu
         1E0jYuVev/nYLn5VEeJ+7I2Bals0VXxfl8MsDJ+Soae3vWyT6+2/l+POGHtFZtbCb6eY
         8LnrnG8rStliUbFg2lHvIdW5bRws8pNWKjsSODia19u1FA0uGKRnfRiIzEDMId++jrfY
         kVyzMbTs2hHnb/MONx65/7xGXfQGUmq+o5hMDocl0fuAFKh7IggapC8WXuCeoFF2BqpJ
         fXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745820655; x=1746425455;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QphPfE+vUE67L3trT4TGohjxqNrvuWYQckH1kmeBzLI=;
        b=gI0H8LNj+zHpNJc/iIAbSld51LcV51tagf5MhWm1XxJ3JoYnOy6jYK2f9ESeg7MG+m
         Ghec5tVLpFxm8dJVTHWBDWG1CQWsHFV6PFrqlztZlGdHQ08F2OxBG60pW+46l4GDl7fY
         xL8jRUZsq6UVJBzhLDPeAjKarfOlgNzhQuJQW35G/KX/toLBsSLiPTvkUw7KTAkW0XyE
         PWIMBqyQZVvtyzaL/DAT3nyRWvOAMfpu4AyMupeVWAzyBT4ecuprUW4bSC6OsnMuM1Va
         1a1FgYDk5UD3k7BW3KMuF+ulJeOe7HHTB+0WPFX35lgSTQMc9TKrEhnpUNiODwUkFQuN
         hLfA==
X-Forwarded-Encrypted: i=1; AJvYcCWs7Z7RaX4kpdY5IUYhibueyrls4y8V0UGsL2/qvJnHbqR/4cVpY1y4RqkoYolnvg8w3iI9+hPY9kpzhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoRItPIz+K9upUc8zhbksygj5IeEbaLObPwRt4D960LLE6CxNr
	cuc564qUBox6qPYoP1P4WAknTyJR9n1+TGq8wHszgy/Y0Nkb3RBo
X-Gm-Gg: ASbGncsn6baWXFDWOqzSBt72GqwU9G7lLSRRtdNsH58+WPa973Uoc+ATHo3zPMALG+k
	uFOZjjw9hpaBvQV50fpHzeIZghEfHKvAsjO3K4szai+z2qgBN37FnJ90zBmGchmdDue7FCy/V9q
	XRWPuY6E74ck9XnfhRynPVknuQOeBKZmAPf699fotM36sP3U0DU/zsXkeGdJwGbwZGTn3lTDVTt
	MUJA3aaknG+/3vPaxeafafEgGbEDWA61GVApptfL92OnKIT5FEPQTDhZ9MRjh/UBopCh3szVx6T
	B0JEPsQ3DmWiWlw5qm7HBQlIPHYEF3uavjubJHTgtbQFcTEZWM7FF3yzFb+LU3KpPr2a8JVESef
	5XqW/2GgzPzWaWvrc6w==
X-Google-Smtp-Source: AGHT+IHkHGWY//K0wfWb5JEsBAo4EX5tBYhxssfjjb2vj5Y0wAC7SsY0YE6ZYBAcqI4jC1DXrJwMuA==
X-Received: by 2002:a17:906:f59f:b0:aca:a162:67bb with SMTP id a640c23a62f3a-ace739dcdd6mr918382966b.4.1745820654333;
        Sun, 27 Apr 2025 23:10:54 -0700 (PDT)
Received: from [192.168.1.18] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70611sm569224466b.143.2025.04.27.23.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 23:10:53 -0700 (PDT)
Message-ID: <3aea4181-427f-4859-8a89-54c139775da6@gmail.com>
Date: Mon, 28 Apr 2025 08:10:53 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/panfrost: enable G31 on H616
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
Content-Language: en-US
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, is there any issue with this serie

Thanks,

Philippe

On 4/3/25 07:52, Philippe Simons wrote:
> Allwinner H616 has a dedicated power domain for its Mali G31.
>
> Currently after probe, the GPU is put in runtime suspend which
> disable the power domain.
> On first usage of GPU, the power domain enable hangs the system.
>
> This series adds the necessary calls to enable the clocks and
> deasserting the reset line after the power domain enabling and
> asserting the reset line and disabling the clocks prior to the
> power domain disabling.
>
> This allows to use the Mali GPU on all Allwinner H616
> boards and devices.
>
> Changelog v1 .. v2:
> - merge flags to a single GPU_PM_RT flag
> - reorder init/deinit powerup/down sequences according to
>    Mali manuals.
> Link to v1:
> https://lore.kernel.org/linux-sunxi/20250312232319.25712-1-simons.philippe@gmail.com/
>
> Philippe Simons (3):
>    drm/panfrost: Add PM runtime flag
>    drm/panfrost: add h616 compatible string
>    drm/panfrost: reorder pd/clk/rst sequence
>
>   drivers/gpu/drm/panfrost/panfrost_device.c | 71 ++++++++++++++++------
>   drivers/gpu/drm/panfrost/panfrost_device.h |  3 +
>   drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++
>   3 files changed, 63 insertions(+), 19 deletions(-)
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
