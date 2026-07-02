Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F82DC32A
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003167; cv=none; b=OaXYLSA2M0Vyz65QhbK48jlSVTDoGTsUKaH0Td93m9FrxWtx+bD45G1P19SenkZpF0J0FEYpSZOvwb5KNYT2LfNHn+uPFpy1YBG0M1PCU3rOzIfCzbVBDcn/T+id9AiXZIlh9WjxyejH0OF8Fjg96S8ewhLiuCxXD/Ff+xsJOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003167; c=relaxed/simple;
	bh=Nd2z+RvhS60YAyDloX5EC/gaJYPXsds4ai1V+Qygeqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MMlVWLsHQW5b9UY2ICz9sIv/nYmngy+D21UqDNNKv72bjn6eRkm3YTJLJrnQMH9pFJsjp5iIHOmelLlaktOc1fgngbFG1x45Rsy9J0fnGSij15L4z7TlmULApI/8/OjTNvJz3FHoKFPO+uudyqkyPSK2kp/ef2zIma5gGDiLvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ej0yGmIg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ej0yGmIg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fd464d51fso953681f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783003163; x=1783607963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/i+wfnz4csbIqOFspyRymSD9kSCFdpRJiOKiIAQ2eo=;
        b=ej0yGmIgUA9Vodcny5tSr3PwJqr75llil+gEuNyCPUlf7jZUqw6t158AQVzPU2Ss5H
         xtwVl7FZMBco4Sug8PDwA0/CRuZ9CLNPMy+g/VqQfnuaxCEG5LbX90o7adBmkJ5pqgdm
         MZw3uT3yEQjnadBpK7zwo7eV/g0x1rIpHk4HL8HhNgCbU1EXBRE1JeOgJ849gtQQ+N9E
         FtQhlR3rxPltFr3RXQfTqf4Kux0gY+ubWM2LT8QzAFqp3+FhRr5ILqwBnP35ZzROzFKB
         n0XiWaTkHylYchqjeCmzv8BPqTC3rW6spIoy+weNhSaB7cqvjpVRgezMkD6VqFXdNX0b
         Mz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003163; x=1783607963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/i+wfnz4csbIqOFspyRymSD9kSCFdpRJiOKiIAQ2eo=;
        b=FoXYoO1yR0xETIzfdOEW81AlDJW5CfghVuERVwsSSoYbutLJBRwS23ku75sJ9TjBWR
         i/SxJMDk16OPWvNoCTSl9q3DIBkOuZ4D+siFWtjjXzUApwsHMXuMDdvc01ayKxTRAWDm
         4IXKxQGqFjZc+0Nrq7VK++wtQUsDEjCCt3B81GoGhT70ny/sPNAq0VCiUf6SqYXRsj8r
         tNpMkndDufSYEvUxq4SiVEB06dKXBdS8aFmpAFWntqp7ARrRmfKmQx+ALrO1RUmfh5xQ
         ZgZe4PHsO/v5leI3lEXYS+H/RetljoKLPVEXMfe0YX4Kt+X8yrWEHlR8W5M9Gx2ennrM
         6+QQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGUot4oDVYlSpGWwFnI82VxPdK/anUI7gB1G4YpenQF8AwTiulsOxOd46/MUWo2SSExxAbnAEaBqP7ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNabrCSbvjJC3v1RjozF5EvKmFtVprBDRlemuD/v6sQ0JkKboW
	zNNha6gU1gAxBaUsCb3SmXN+luddN4Ykp/Ie2yAg63q+Fb5/3KAEAKVZ
X-Gm-Gg: AfdE7cleuMz8+vk12jU/NCUMQjZqlfxs1RaLUPzgK/l9pSGdUG+sUpOJX5/xcbhtm2K
	lxzITH6qEw6fM3eUh2ZCy79mWoLpani4cfkvlP3hirRFR2cZ0li0QSU7qo4n+CTPpX4xjSr+FWE
	Pk94DB7WdhE8k7eWtOoIsaG9b1Kt/M1ULr8fxDPDBXEby8aHMXo5ox8lADZuW3XYONLks7XC8up
	tSTzlzUQCZKTQfOVSBvUFxW/mXLr0TAMs8XsV4gAuw4kH/CvuayI3lywUQWLHeHpA7ht1E16Kpk
	J/Wc/bZFKtep0uufh9sXj0U7lYj/vS2dGTkLex1TM+DD1523q7YUyWvD/TfI6uvJZxgoeEoylOd
	yMwrzuRFfMsSksg/hdb7zOx8JuB5OtoyUoQJOaw2oPbNt26ry4YZtMVMVBnApZaegHSl/xBlxRw
	Md5YjNefpLJ5VUpTr1Lv5k2nCoQygxMWj2zV2H40hDJ1fI6O61qa6IfZlLXrwVTvInVJWh9d9P3
	FlSVI/67BVLmtpQOYlWYS6Y1jOkegjlj7K+9h4qi4R6d6kBqh6qlqA1baDvMRU61wuRrjTMYonH
	q7/mTsb1N6qXkmqyhfBmrNun7EDslA/d00X2WW5XZb5UNIWA2Ac1O0tYHhgLdMnGc8afR1sMm/L
	8yoWnm88qbPfHmxrVauAn8CpLLVcVHaIXXr28BDOlTqhuoghJvZ5mxd5013Tv
X-Received: by 2002:a05:6000:200d:b0:475:5454:49f2 with SMTP id ffacd0b85a97d-47757e57dc4mr9598046f8f.24.1783003163301;
        Thu, 02 Jul 2026 07:39:23 -0700 (PDT)
Received: from jernej-laptop.localnet (92-53-159-70.dynamic.telemach.net. [92.53.159.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbc75sm10135277f8f.5.2026.07.02.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:39:22 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Diogo Silva <diogompaissilva@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Date: Thu, 02 Jul 2026 16:39:20 +0200
Message-ID: <Tm9Bj9tsS_qxKmbhRnECBA@gmail.com>
In-Reply-To: <f3f2320f-dfe7-4728-9cf4-c3eaab33d09e@suse.de>
References:
 <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
 <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
 <f3f2320f-dfe7-4728-9cf4-c3eaab33d09e@suse.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 29. junij 2026 ob 08:51:52 Srednjeevropski poletni =C4=8Das=
 je Thomas Zimmermann napisal(a):
> Hi
>=20
> Am 27.06.26 um 08:55 schrieb Jernej =C5=A0krabec:
> > Dne torek, 23. junij 2026 ob 22:34:40 Srednjeevropski poletni =C4=8Das =
je Diogo Silva napisal(a):
> >> Simple KMS helper are deprecated since they only add an intermediate
> >> layer between drivers and the atomic modesetting.
> >> This patch removes the dependency on drm simple helpers from sun4i
> >> DRM drivers.
> >>
> >> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> > This doesn't look as useful change. Is this tree-wide attempt? If so, it
> > should be done in one go in one patch series, coordinated with DRM
> > maintainers.
>=20
> Yes, the interface is supposed to go away because it is fairly useless. =
=20
> It's a low-effort task for beginners. Hence many people send out such=20
> clean-up patches for the various drivers.  If the change is acceptable=20
> to you, it would be appreciated if you could merge it into the driver.

Ok.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


