Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8556C25771
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760859864; cv=none; b=JEIr45Z9KevAmO9SyVYBU+VBBK/lgDBldt7k5zuo8cF58ny4dgdlenXj7AKUYdfhhouKf1TChjp0hCQ3yLg/vUs3xTcBlfCr7bD4XuY4lPxwj/PHPN+Zm8G55JuiDsTG8M1J/Jk9MbSW3KyYc4C4ifCTIZthBZ1y2H+9vIw/6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760859864; c=relaxed/simple;
	bh=VDyEXvhcMjHGVLUO7kySkl3Qfnll/RHQf72z6TXt0us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioDPiuEf8wBhNxu3yjGKldjVyAqs2iBQUV6CBfrWGEwVp87yDmhKZfg3oqUvvlgQZg9O+THu9hphtFSy1btrZmf0EOczND2oQWuMLkvOnu01edS9Y7CVue4Ndxd2xnqjkA+ix32zUha5ayFJOQzYqnKSQK6eKohWFjq8hmOXQks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5797c8612b4so5116404e87.2
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 00:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760859857; x=1761464657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDyEXvhcMjHGVLUO7kySkl3Qfnll/RHQf72z6TXt0us=;
        b=I5kDUrt5X/vNYysamcjYhQ9JDNnC2MFvP1qyFOg9o+jLddNLyxa46Bzv/Rt3C+HweS
         u1gD07NGEZ6OjVxmJOvcVVuNhE72Kc4W5om94vkNF5VdUX7KM1AaE/CadFehkOAuQlq5
         Om2kZkQALCPMC5oyFXdMSKjn5mczBvVPySKgmQuLo4b+9l+elhDiC2f2/QJLkVQazjBq
         +Ic3vC/yAfSA13WdNoitOtA+e8J9CbGkHdOcv613QlgIwHDXc/g06SVC7s1Mh9GCu67j
         4ra4GRvXRgMJndKaq5cKsYgLrtlYAhIiM3hlwD2JIFJ2RkrSKNfrmjd5LFXx8WJD54ZR
         0XpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtkTtZuTXPYU9CaRxHjebnKcHwivuWnetZM0AWLCqfe2jyAoDjcSjubAnIIU/CcDsaN1b2kvE6tmGvoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3EDdipNKRs0Ls3hCbt+/Aj+IOQPp80jEdqFrdyubUpCsCsmJ4
	EWdwC0VtnqlylhEswR1UFv06kUen4TbD5YI/f4t0aph45UASjrs1m4sNu3q5Ol3s
X-Gm-Gg: ASbGncuXbasVqX32NSmvYBwi78Abh9n+VF1mnoaViApI57if9SjKHf+9jMI8JjYb+rv
	lfUQntRjEwf6Z8N9OxHoLQKTps1luMDx+WEqYICk1AMRoI11A5pMOv/ebGCs5NwuSfSFdM+XlAe
	VjJK3QP4tReOC27jJIQD+k/DqSfB50ybUn/9+ByqsoNZDOoqWoLyp0MfqHs5gjo2OQwPNJNImFV
	ndhQVuKiOcffFKG/402u5Z16XDhvX6WsXwWduUvoLKvspqGhvaJg4OhHx/RIc/3M5xfnxa+kEyw
	jsMu3EnbKdSok2f4C7ignQmOcDtclGpbDkRvv5G5sjzd+toDgZ1Dv3u6pUl4/+tkQKBevz+2Fk6
	WZEiBz/vfUDY0tdYUXAtiDgMuJm4wkkvYPLCt3NKZs+U2fYJrKVKnIjQvzPfVhVH2Ge+R+IEGgi
	+iFztNT3NKtmOHS+wHZ4OBs2Wg2gPYZRYbCnPuS5Tx8FB3xmuFzr8xzg==
X-Google-Smtp-Source: AGHT+IFbxWisSABtI9SUERG6xN4AoRpEju9dU6PIEO2kftfGW/51+ZP6axFVnxH/yUuaFapDYpq75g==
X-Received: by 2002:a05:6512:2397:b0:58b:27b:ed30 with SMTP id 2adb3069b0e04-591d84fae4cmr3211206e87.22.1760859857250;
        Sun, 19 Oct 2025 00:44:17 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def25a1csm1331175e87.105.2025.10.19.00.44.16
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 00:44:17 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-36d77de259bso24962851fa.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 00:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSo0F6ItiYG/Ny5SXn2PpzRCtplWCLqSy7xEiHHDMyFMjNR5P2zjBgQxqgLGsgFlUXWr+A+LPxZeSh8w==@lists.linux.dev
X-Received: by 2002:a2e:9a0d:0:b0:362:b98f:edec with SMTP id
 38308e7fff4ca-37797a28204mr31528471fa.23.1760859856735; Sun, 19 Oct 2025
 00:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-4-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:44:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v64QDvw_rQN3v+zPLp8YBcfQBZvOBenKQQ__g7P=kLkucw@mail.gmail.com>
X-Gm-Features: AS18NWA8cc21pStw1TYls77Vg9dX4gj_1oPuVNMT5dpbk_Fef3dnnMNukJyo070
Message-ID: <CAGb2v64QDvw_rQN3v+zPLp8YBcfQBZvOBenKQQ__g7P=kLkucw@mail.gmail.com>
Subject: Re: [PATCH 03/30] drm/sun4i: de2: Initialize layer fields earlier
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> drm_universal_plane_init() can already call some callbacks, like
> format_mod_supported, during initialization. Because of that, fields
> should be initialized beforehand.

I think fields should always be initialized before any structure is
passed off to another function.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
