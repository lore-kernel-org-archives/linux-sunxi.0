Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0881CCEFC
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Sep 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461586; cv=none; b=qVe1IiKjtlCQBUtZo7jfkJqB7Gl4JzPxZzNsfTzLd4MeL5vZQ+ttSGj6gyJvqKKfCkMi70Q0NgFSYvq8y5N1RK19btnkdWwBqtneqe2Jl+KooqsnIlnSyoLy5mHG8OZf38zCAuKwLBoKfoD5CO/K/9s3sRFiVrNU6fdGkaXhhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461586; c=relaxed/simple;
	bh=bS3cyxTkIotmDr5nHPJT0xy5QK/kYKsT/AREDDDATsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+psaW/VqCQ8TySBJ8tLugcYqAhcQXoTqWspQxs7jLrSY1zeiYphKmEay6z00wj7cgZQF/uZvULGylVkrBlwVhbHaNIoE3bn5JSXt6XrvXmrjo4G+bduVFAUi6HXue1tJbpRFtBTabh3Hpfj6AHAxtPcKHH3je2U9XQlkSiE94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so8248108e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 07:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461582; x=1726066382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRIsPL92HswU9zfh6e8X+nP5hCYe1ZQzHxllYIYwBAU=;
        b=QFmtRcuK+d4wqGKidqWfr6Xb1fk/GIR+5nlUgg9cnY93INEW07SyyVp5QfhvnJKJEN
         wUsoZplr45czKlLp9974TUgo1WnE+V28bthLcFKPROFoBUI/jo8YdmKvkiJ2FhfueO7D
         4msHhH6WQXUculHOoM6Ut6Lbc3r18ScLbYBExQs54taAENnyECtBo8Aa8SWFG/F2SnKy
         3o/WKYtulk0S0dyqpGW5eYBWTBnX939KBkVaf57CdMDtEPD/62mYtn2o9bRgPW2DEj9h
         HT1xWtI1xyWBGGyGXdLtTR7ryt6SC37UJD13gTqwgtNL/R+aLjaeSi4ylu1pmaMvQHMk
         lJaA==
X-Forwarded-Encrypted: i=1; AJvYcCWYLzwnWw5pgdcpNSlkFR8GW+3vxYBpNp9vzzvDXXFKaDSzh0b2Ge35T1/08l4tqSlc0mJHR1GnYluY8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ0Hb6nr039So4f5bOxbWn6qYgkhwsADj2f8VPSI3mfx77Nief
	Nd9cTWnSbZsALPk9iFJyZaOxJ8c3lM1+WbZ3OOUzFOb4KbCVAJGGG9/E1jMq
X-Google-Smtp-Source: AGHT+IHTEPEt03I20sfaXoLyC8uq4WTj+efAVsXzV6m/S+C9rG6NBY3fXM5YAwRx5YwJ5CmF4Unn3g==
X-Received: by 2002:a05:6512:3b0b:b0:530:aa82:a50a with SMTP id 2adb3069b0e04-53546ba0471mr12162499e87.45.1725461581961;
        Wed, 04 Sep 2024 07:53:01 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53566b69676sm243314e87.296.2024.09.04.07.53.01
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:53:01 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f50f1d864fso78419721fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 07:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI9lXGKb1AGWCahYXltd95JpfS712isrVjGXB71xDVsoG8TRT8efU1uF1XbbPUUNR/M/+cZE+YcMg0sQ==@lists.linux.dev
X-Received: by 2002:a05:651c:1a0a:b0:2f3:f4d1:1132 with SMTP id
 38308e7fff4ca-2f6290bb1e0mr72319961fa.33.1725461581630; Wed, 04 Sep 2024
 07:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
In-Reply-To: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 4 Sep 2024 22:52:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v65qZweU+iB+3BBkkcHhQ-aPWUCcPLWqvPdXHCOtOXhqfA@mail.gmail.com>
Message-ID: <CAGb2v65qZweU+iB+3BBkkcHhQ-aPWUCcPLWqvPdXHCOtOXhqfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix regulators and assign them on NanoPi NEO Plus2
To: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 28, 2024 at 5:01=E2=80=AFAM Kry=C5=A1tof =C4=8Cern=C3=BD <cleve=
rline1mc@gmail.com> wrote:
>
> Many thanks for your feedback, especially from Andr=C3=A9 Przywara,
> I learned a lot from you and your kind words motivated me to do a follow-=
up.
> Regulators should correspond to reality (schematics).
> Proper regulators were added for pio and r_pio.
> Added missing regulator for mmc2.
>
> Signed-off-by: Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com>
> ---
> Kry=C5=A1tof =C4=8Cern=C3=BD (3):
>       Fix NanoPi NEO Plus2 regulators
>       Use regulators for pio on NanoPi NEO Plus2
>       Add vqmmc-supply on NanoPi NEO Plus2

I just realized that all your patch subjects are missing the proper prefixe=
s.
Can you check the history of the file you changed to see what is usually
used and send a revised version?

Thanks
ChenYu

>
>  .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
> ---
> base-commit: 6f923748057a4f6aa187e0d5b22990d633a48d12
> change-id: 20240827-nanopi-neo-plus2-regfix-b60116ce12ca
>
> Best regards,
> --
> Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com>
>
