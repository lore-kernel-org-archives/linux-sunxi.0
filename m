Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF9A1ACEBE
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Dec 2024 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735667079; cv=none; b=jaGSxKgU5DRpTF6AflwoS/izr1zyZAO3kzwbiU3TAHw4JqJ3Zxf2YxdH2tlkJaRznrz9+RZ5I4cbl6sDJhKEpogoHKkAzEZh3tb175nrEGRsZ2wZBm5COz55MLSu4cfgnjxufgi7Z3xoPMHCMjcLF5mTamumTxA/nKjGDoXJW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735667079; c=relaxed/simple;
	bh=m/cyulKYXjgyG+TRTLjmVT7aw8fJhM9C4kpDOC7tjYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS71y0ooWGHvmZx3fJaeMMUrjV9Y6EaA+wTrlJSFOFqTL5fR2osdXNfiVIKsYXRWWa58pYW9Iw1x2gkq1bkDUHuorvbXdVI2ei7b3e4ZtAhf8vTljLcgDQBaIf5oR8BGPCbBJap43M4j0Ncc6PQyk64lSufMyxapVVNjmG+dZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30033e07ef3so72325691fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Dec 2024 09:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735667074; x=1736271874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGqGCFlIfyNjV9vijKIVvvUaUnOHqLjovjeWAK57WWU=;
        b=ZABFtcvbyqmhNohUmlSmQCt0Ps93+urm8hf9Bv12azc0otIwQfukkaaUZZ5IpILMHa
         TdM/xb7jJUIb5GuWXgg2E7hAIxAHOSGsVbsNwsjc8u3fp83wT54AwUpz7AuECRQWUgXr
         q9rFUDJo31ddXaFJBvPjtEkNNRZTQF/Ysn3F6yhVNW1IigaMcds4oLwvdFdora5RJvs7
         MP1OwKbhQT7yz+k9nXMNjywd3M9YyZyvu0jfX1OAp2YWE9CS4gmmUNVd+62kO7VJ7Y6G
         suLCLXy5zQ1doYJMJtQ7dGVny66PRrYT7ISVKn0XuM4+/tIg8BOZ5vlqEJl9wBkeW5lL
         8GDg==
X-Forwarded-Encrypted: i=1; AJvYcCXeVPsYaP/47H5BzjWlqIZ4axO6Xd5l3qQzIR2+/su4dHCk6/Z38A5SRU4XnBDkjjKUVXUL54yP5Y8RSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyeQ1v/aj0+DojZtfqRNA6L4wo3Dbh31bD4MK+i7/2WuOGHrDN
	pHonORDXaHFMFnioznWvmG/qrIklpaig/mNiJAvkOohazuhEhIyO4BzwzN2f
X-Gm-Gg: ASbGncv+YFXCMVuc3c7RtzpZdWlGJU9gBBusYpq7WBdlIRAnOss4w+snY8uyhnvsByd
	A3AgUVt0UzS/jOc9FC1L28BP/gcHcWHK06BwSxZITF0g551iYKDIMNMJj8zNrKhq5f9tEvNUR4m
	94UEUL4ExpQn3Lv4VfL7UINocee+yZ7ZJsrX4ngQnuIrNJibMWgS0UuQzxwbpTwjpLu0xEjTO38
	6FAgWJA7K/NzdNOqkPXpLm0s//WlyVoefuCgiXGyEkcgPb2N5xEQDQf+0paIbJw3xOiEqbDSCPK
	+zM22vmnP2yiBg==
X-Google-Smtp-Source: AGHT+IH/g8rYhi/bcLAYDQoxtWQnka3tOuqhqBTLzsokpsYMrYJ8ZdqgMiWLoDgiv5gaaPOVo28wRA==
X-Received: by 2002:a2e:a589:0:b0:302:1cdd:73b9 with SMTP id 38308e7fff4ca-30469b420d4mr115543931fa.11.1735667074063;
        Tue, 31 Dec 2024 09:44:34 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b069bf2sm37853301fa.76.2024.12.31.09.44.33
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 09:44:33 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30225b2586cso121199301fa.0
        for <linux-sunxi@lists.linux.dev>; Tue, 31 Dec 2024 09:44:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWc5hXwOZN8XmLUwVtJ/HTZ61ag2BgG43k1FOqI6jPphHAQKKBXhdzb0z4tusBe/ONb4WIp4NB8W+zMDQ==@lists.linux.dev
X-Received: by 2002:a05:651c:a0a:b0:302:2202:14f0 with SMTP id
 38308e7fff4ca-3045837109emr118075391fa.11.1735667072958; Tue, 31 Dec 2024
 09:44:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241231165103.800752-1-andre.przywara@arm.com>
In-Reply-To: <20241231165103.800752-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Jan 2025 01:44:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v67zRWx7U6wABkyPKG49c071KoMJDgfCS-NA7wj00-ReyQ@mail.gmail.com>
Message-ID: <CAGb2v67zRWx7U6wABkyPKG49c071KoMJDgfCS-NA7wj00-ReyQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mfd: axp20x: Allow multiple regulators"
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, linux-sunxi@lists.linux.dev, 
	Chris Morgan <macroalpha82@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 1, 2025 at 12:51=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> As Chris and Vasily reported, the attempt to support multiple AXP PMICs
> in one system [1] breaks some of the battery and charging functionality
> on devices with AXP PMICs. The reason is that the drivers now fail to get
> the correct IIO channel for the ADC component, as the current code seems
> to rely on the zero-based enumeration of the regulator devices.
> A fix is possible, but not trivial, as it requires some rework in the AXP
> MFD driver, which cannot be fully reviewed or tested in time for the
> 6.13 release.
>
> So revert this patch for now, to avoid regressions on battery powered
> devices. This patch was really only necessary for devices with two
> PMICs, support for which is not mainline yet anyway, so we don't lose
> any functionality.
>
> This reverts commit e37ec32188701efa01455b9be42a392adab06ce4.
>
> [1] https://lore.kernel.org/linux-sunxi/20241007001408.27249-4-andre.przy=
wara@arm.com/
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/mfd/axp20x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 251465a656d09..5b8e88341a305 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1445,7 +1445,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>                 }
>         }
>
> -       ret =3D mfd_add_devices(axp20x->dev, PLATFORM_DEVID_AUTO, axp20x-=
>cells,
> +       ret =3D mfd_add_devices(axp20x->dev, -1, axp20x->cells,
>                               axp20x->nr_cells, NULL, 0, NULL);
>
>         if (ret) {
> --
> 2.25.1
>
