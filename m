Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09F19F464
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752597203; cv=none; b=pH0LidFPm3tLNZvH31PlB88iE7hsr+TXIrs1wfLlRTH//Vt11c+fZn3azezdoNeTQtPbzdB39JkSfXnVhekVmBMHAmZksZSjHXOq6aa8TiWbcrFgTCWPHN7qRjVBjHNLoI+dXjH3QvkWAylG8sZkIVq1AvxXbOVAM5YO//Hvusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752597203; c=relaxed/simple;
	bh=CjUnx4qglKnCSPpRJ4ljeidpsB6he1PLq5cS3WxpqKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7P/NAhBdFLl/O3+hVJL+eSqpLa5NUheAP0NPyx6aoFrKzIIY6HliUFRFLk0d90SdjIe3t0Foi1ZA/ocORxOokT928rzd9y1aOl1/9VAxoinn22LrfvOg6hlK8qv2ex2ydBzZoYy/Z16uPrxe08U7gABx3IgZO6Vn6yhH7PcHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so60231e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752597196; x=1753201996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQNw2leo+Ol5kg5pwyn/60G8pbTVujZAHkW7U5wnbhI=;
        b=YNDHZCFe9CGHwhPwwmTYO/I/lAbPO5Fo+U5n60txpa5qM8sESqZ3/3ZqdBR5Y6vFAu
         X8fJTwPVevcwmA56EYRlggR5EMbNexj5WUILVUOKlvWGMBQctxqQdDoIjro9h8GdEGXs
         qDBPgEZGSCKdmfCNsYzxPvLbRaK2+e4qdzdz55uvJDfcr0gXquqSA20aLvXwc6V3UwLG
         iAqwgpM6wfW5bwV6sUvCh/ciOccewC9+lRxiFt/X3M+kLKk9a88L5BAFzAvNOtEpY1SA
         IUjzZHPgBqCIW7Qp9q9oEZOU8YP41qVfLfxl/9n3tqv5jqoAIIBtq9Eft+naI49dIaE8
         cU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvAaH9O8Bb2RewMd+hfy8XKx8lsmuXBWWUQxrd8tBvfDsU1LnzSiTzxWlvody0TyBk3viaHNuLiKqJ3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyR6CKkmnsjxtqwgp6bKKQ7JUYombsMzpXi9udGR3HojE8p0TJ/
	GNfYEfoqS5n373XlJGE1w8vnsw+OBoAP2KB62myefjAloVdDfuVSqDCcbHtOdq6B
X-Gm-Gg: ASbGncugSyGpo7voNzPhROim6A8nAgd0wjkA2xlKgp1TjCdOzM6+jhRwRB/qHg2QLvm
	nMFK0+KeZRE9qpwK2IbFmevgAn3o7V2XyalwloHUT0+Itbl1qN1Z3KLW3jQsVNOegFgvSUQAMj9
	jI59sTmfa7qHajtKEMJkyZOeWE0Et8Hfq2pMoz6R9OWMbXdBcds4Cl6GmkfYy8Egm72agj18hO/
	Le4aszZA4Y+dfQfUg9hhuwEv5aroP/mvrd2IPA4pJr0wRUPD/UIA8ElpgQVPg1BKgZC5wmPEOqI
	aXdcMbQmY9DZXgMfR86zX1oRGrCwnmxz+cYNwY08fOk98OeUS7XDzRDj4FDRkiaHfsJuhfMX/95
	ODJ/Kg/1jhaeEEDm1sMEkfXfBuSds71gPkyJHet7D9kKfj0mB1k13okE=
X-Google-Smtp-Source: AGHT+IHevDsQuz1lza2qgwWFKh+zc796pnRZYv8+pYJD7oR5HiY+Uw9PpwYsKGX7A7zbHQfJEc8Yeg==
X-Received: by 2002:a05:6512:400b:b0:550:e04d:2b66 with SMTP id 2adb3069b0e04-55a1c462e22mr1436918e87.17.1752597195664;
        Tue, 15 Jul 2025 09:33:15 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b711d9sm2344282e87.171.2025.07.15.09.33.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 09:33:15 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so577901fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jul 2025 09:33:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4AE85NKyb3j2NYRuB+d0o3rqdLO+5dZtEeeeU0D/r6z2SGxt0rsz8jOEjQC7BKrvP1e9wGVxT4XRu/Q==@lists.linux.dev
X-Received: by 2002:a05:651c:214e:b0:32a:7454:4410 with SMTP id
 38308e7fff4ca-330811e3685mr8516981fa.16.1752597194142; Tue, 15 Jul 2025
 09:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075358.3216894-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075358.3216894-1-sakari.ailus@linux.intel.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 16 Jul 2025 00:33:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v67XWOQQnFterdYixP9JjXAop0=nOpwwtj7Ede6THaMdUA@mail.gmail.com>
X-Gm-Features: Ac12FXyC8zkOlZ-J70-qmRzAihPtcAEM5lb3HzZX18bW3blmNya4r0lMEGeXzOk
Message-ID: <CAGb2v67XWOQQnFterdYixP9JjXAop0=nOpwwtj7Ede6THaMdUA@mail.gmail.com>
Subject: Re: [PATCH 04/80] bus: sunxi-rsb: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnd Bergmann <arnd@arndb.de>, Zhang Zekun <zhangzekun11@huawei.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 3:54=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

Could this go through the PM tree?

> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ail=
us@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the las=
t
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 \
>                 pm-runtime-6.17-rc1
>
>  drivers/bus/sunxi-rsb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index 7a33c3b31d1e..82735c58be11 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -373,7 +373,6 @@ static int sunxi_rsb_read(struct sunxi_rsb *rsb, u8 r=
taddr, u8 addr,
>  unlock:
>         mutex_unlock(&rsb->lock);
>
> -       pm_runtime_mark_last_busy(rsb->dev);
>         pm_runtime_put_autosuspend(rsb->dev);
>
>         return ret;
> @@ -417,7 +416,6 @@ static int sunxi_rsb_write(struct sunxi_rsb *rsb, u8 =
rtaddr, u8 addr,
>
>         mutex_unlock(&rsb->lock);
>
> -       pm_runtime_mark_last_busy(rsb->dev);
>         pm_runtime_put_autosuspend(rsb->dev);
>
>         return ret;
> --
> 2.39.5
>
>
