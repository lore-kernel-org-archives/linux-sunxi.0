Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE27082E
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867398; cv=none; b=WpdP1CtUKQ61frO8UjfJ1MpozBAnFDIfHE9mmUykqNUgtAGZrlSXxnPEhqi3Yej2lrsGiS/3xvspAKNcQLguU+66MnU4d5As+LMV7WwGKMhTGGK5gHYAuuB1ZqDV06DHN/oivzoeQgCRKCftoKriFdC7rqTlAPX7H4Jsk95vQIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867398; c=relaxed/simple;
	bh=Ov15ZXxPnj6Uv7h2iz3N/YH6A544K+AjCPRgSiob/zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOR6u9WAkDNPN6oIYcJmLQTidVGY5Od3fSYU49ZvmThhBLgXQ/pGOeaEl1SrQgEb1JA3+XfxIS924Y2sCwmL7KDwLtECOQH1MCWNHO1WH6dazzJk7GSlzMXYZpEz3ao/CQ58Tl2PLJoDGi0F389dUsnTSRKRQhk/cHpGLnigX88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so23384041fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867394; x=1730472194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AU/PzZlykHHoujrVc3gxuX+4ixyqcg60/hgRaGyT47w=;
        b=AqvsLbVxX5ZCOONkaHU4AXHxvJ9urrpLLolRyR4EI08HdLRGUK6UB+d4lcBhuQr2rz
         DR+XgS4/h17BwXEyj9CaQhfzgxERLQLi3ZKTV9yd7W8cQI55bZmYMy32MAMFOLcwU7ya
         2ahr5X2//JVGyyNJKEHmHzaItgig5p66vJNLnBI7WOl2kKqrd0bLK0aG3rTMQsfZgBxa
         1GD2DcsVLdeuPqOo9j9SazmWm2gbC0abGMsHKKqo3tuHmKYNhZcqgks9yf05rugWq4vi
         jjRO7Jwrzj9QQHbVto3bB86/NcihfkcgLf+c757vMdQEl3RSsvBsLQf1VrdGDW/3H49V
         7b2A==
X-Forwarded-Encrypted: i=1; AJvYcCV7L9WQtbGlMtKxgdEAJfpV+L5yIoe56uiMs33UAMRb6dgBHlEr5dWgjJ0Hr/0letmG8hSzRfH08ohlyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3rXX7s8w8279CvcQkT4B1FQZaSGo5fLFtIBVbScSDk69zqZa+
	ugcYZ98BcZZCf0rB5ev8rxqrTiEoQlO9wRAfjLWc5KA5fYT8Edg8oG0Skfoy
X-Google-Smtp-Source: AGHT+IEISuMGniiwm6ljwNkIEp4Uc2FTRvhl8viphGnaR7+OviAoiZuozI0JuzrnaarECCRMrt7dLw==
X-Received: by 2002:a2e:1319:0:b0:2fb:65c8:b4ae with SMTP id 38308e7fff4ca-2fc9d376e3dmr44465961fa.31.1729867393771;
        Fri, 25 Oct 2024 07:43:13 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb461797csm2082561fa.128.2024.10.25.07.43.13
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:43:13 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so23383781fa.3
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 07:43:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ5/QGQhnN4oirtP1orkJRaJiSlURIQ7J8ioX4SdlHRsdqn8xIvgOr98MMX6ZhcsuArrr/VvkjeQax7g==@lists.linux.dev
X-Received: by 2002:a2e:a991:0:b0:2fb:6057:e67e with SMTP id
 38308e7fff4ca-2fc9d375a1amr60051471fa.32.1729867393241; Fri, 25 Oct 2024
 07:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007222625.18883-1-andre.przywara@arm.com>
In-Reply-To: <20241007222625.18883-1-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:42:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v671y0EkMKmYJKqPp0ek3_-kv26adUjG=g5-tdPe+5f3Hw@mail.gmail.com>
Message-ID: <CAGb2v671y0EkMKmYJKqPp0ek3_-kv26adUjG=g5-tdPe+5f3Hw@mail.gmail.com>
Subject: Re: [PATCH] sunxi: power: axp809: Fix DCDC4 programming
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 6:27=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> When trying to set the DCDC4 regulator, the code was accidentally
> setting the voltage register for DCDC5 (VCC-DRAM). The higher voltage
> doesn't harm the DRAM chips, but upsets the Linux regulator driver: when
> it tried to correct that, it tripped over a separate DT bug.
> The DCDC5 DT limits are 1.425 and 1.575V, which cannot bet set with the
> rail's resolution of 50mV. The kernel driver gave up, and made in turn
> the system hang, as the PMIC powers essential devices.
>
> Fix the copy&paste bug by using the correct PMIC voltage register.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/power/axp809.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/power/axp809.c b/drivers/power/axp809.c
> index 9e38e1a7450..ec3eca1ac4b 100644
> --- a/drivers/power/axp809.c
> +++ b/drivers/power/axp809.c
> @@ -93,7 +93,7 @@ int axp_set_dcdc4(unsigned int mvolt)
>                 return pmic_bus_clrbits(AXP809_OUTPUT_CTRL1,
>                                         AXP809_OUTPUT_CTRL1_DCDC4_EN);
>
> -       ret =3D pmic_bus_write(AXP809_DCDC5_CTRL, cfg);
> +       ret =3D pmic_bus_write(AXP809_DCDC4_CTRL, cfg);
>         if (ret)
>                 return ret;
>
> --
> 2.46.2
>
