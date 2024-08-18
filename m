Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB49B666
	for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723988529; cv=none; b=B4Uwfe3l/1aoq5eHSp2oBG8w1X2ZOVtKt87OPjvnV6XM/b/psrf0oqtDxzrvtqtfrWkP/ZizSxA7DC3w0NZkw4Iu1X8wHXfyp3scdUa6VTG3dbi3u6f56cBHi9jyyTFZSXoww/siPfpsWLuCIc2/6tItC2ub12nCa2mkiBZ03wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723988529; c=relaxed/simple;
	bh=whPaRlGmH+NJXjZNAC8fa7shH0Iu+3/wkcGkkBavjHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU5FdS7O581K/feiumHz7CsHys+PDRkGhK7mIMn8v3wkDrPKnbnuxrkyS8R/nIXvWGq7ZefzJHAilTzdVy2B/2J6HPuu8Keq0V6tb4SPnR9iU1oh7eEDnVwRNPjRJvpYhKx8rM1gw2lKYFOYzzs8nSTHkC3D17Lh3mk7EcAyLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-824d911b6c4so132327039f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723988523; x=1724593323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whPaRlGmH+NJXjZNAC8fa7shH0Iu+3/wkcGkkBavjHg=;
        b=a/ikV9fmx08KbMBwjja6QYSj40FVWf4xzD9A59WgTnuf3xvXMWOZllkrBBnX66ge7f
         XbAlOQW1Flgv56jnSw3OPxifYMQurzexGbwUIExFndqE4tOFlfdF5XpFqlQ/qbboYVhc
         +gUN2Cl0Jh65QfI6E9QDyTt1aoC0petwxPHoQ/+F9fZo5oc/34THlVBWC1OnM5kFnzVL
         3W/tm94yJ2TXZUrL98E3FzRUhp2eCyDZ2b88AXGnWB+9FAzdXf5dZHENY1WwXAs9RU2s
         EaDJxM+Okst1Z4RQgtWg2V07j33pAud7npYNiNBds6XFMEyJCFdNOaze1OGwjYHLCPma
         43xw==
X-Forwarded-Encrypted: i=1; AJvYcCV/q4CNeLTV5bAot/C1nPPF9ILxJuGYY5svUYykMhl6f8uae4MR1ptnxAnnYuptJdkVgU7XCmcY/69O918Xd4U5dCOXc/b0CJior/M=
X-Gm-Message-State: AOJu0Ywg+jlNaslkX8Z0wOC1OJeIPjCFPaBs9kDv1bwSrNfafkSXhwo/
	KYqv0RBd5PzCQLufsxNLWrMSsR8AWgspNWl4Uhr3IT8+xaPCuh1ZkXF2oQb3DxY=
X-Google-Smtp-Source: AGHT+IHrkOy/6W53UytkYm6A/IcxVMfP8BO5aV2UuKGzrxH/0ZWMhs19k8d32YNyaO8mV/iLalhfdw==
X-Received: by 2002:a05:6602:620d:b0:81f:92b6:8235 with SMTP id ca18e2360f4ac-824f266a23cmr1048886539f.6.1723988522695;
        Sun, 18 Aug 2024 06:42:02 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ccd7096964sm2480931173.173.2024.08.18.06.42.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 06:42:02 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-81f95052c2cso215879839f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Aug 2024 06:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKRhy/qOsR6Gz+oEyx8vkF/rQtslX+c08K27TSCpZRM638HmGdhMggm8VgG9HF/ffuS63d/iY9jhUzWuwwCtjtxqFwIufLyaXwkX4=
X-Received: by 2002:a05:6602:2d94:b0:824:d6ed:e479 with SMTP id
 ca18e2360f4ac-824f266b92emr827432839f.7.1723988521614; Sun, 18 Aug 2024
 06:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817230503.158889-1-ryan@testtoast.com> <20240817230503.158889-5-ryan@testtoast.com>
In-Reply-To: <20240817230503.158889-5-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 18 Aug 2024 21:41:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67OCPz4O38Lgduu1pasjE56dCuGbzYNL_RtjqsnTJZqCA@mail.gmail.com>
Message-ID: <CAGb2v67OCPz4O38Lgduu1pasjE56dCuGbzYNL_RtjqsnTJZqCA@mail.gmail.com>
Subject: Re: [PATCH v3 04/26] drm: sun4i: de2: Initialize layer fields earlier
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 7:06=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> drm_universal_plane_init() can already call some callbacks, like
> format_mod_supported, during initialization. Because of that, fields
> should be initialized beforehand.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Co-developed-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
