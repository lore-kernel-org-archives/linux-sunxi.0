Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767091494C3
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jan 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178533; cv=none; b=gi8fIgjkdJmZLjjRPS/Hn/Jp84B5sjidkcORX1D8byHJeI4N9zub0GRPd17Jz/cSOhjKkhJvISXz/HuWswIkLX0ooGUh4nOtdJKe68tIjZL11CRJrtjgWW+Cq08IHY2e6TFTLtfW8ZF5yq/CWNutnmdvtxcH5W9BM8UGHywpB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178533; c=relaxed/simple;
	bh=I5EeJ+Kq41D/Bv0Ajrh0n4I+EJ9ou23hfrzgzaRrU9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZLlZ2vDOoC6aoErvx8rNM6+DTd1G2YcXfRLFaY1yt5PWrYLpHMPzhb5l3bWqfHsYphp3tLLm0zFNphWcY9LTBKY/jHWwTWiTYfOB6ApW7Nsz4RVGLM8q5WlWn9lCpHyWZr91RFgKFu+RQ9FpR0RcSeOXSSc2O/wPpEZSAQQFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so15307240e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jan 2025 07:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178528; x=1736783328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5EeJ+Kq41D/Bv0Ajrh0n4I+EJ9ou23hfrzgzaRrU9A=;
        b=vO+cxe/uPbPBrtgUbTKZ4ZwFN9GLPZqooNItIjjZ9cpocvIJiT4JK/ruf+ovtG3tsN
         K1DDlRZ+FYgTy1gdhmtiZkG5QEr/00VZK443x/1WUauKRIXgwDnO2PXnd/ZD1yhGLIAU
         qJ5bXTOojVz/YBuORZ77eOPtmNvYOXAVM0Ok6VrafTIrutDSOcwAPLOH6l5rrN2L/ots
         wXbk479+5q9VTc7M5IMXFP2MniWKyparV25MeDgI+NtZSuPNUBkQ+ZO8EGsdoOcQDcc6
         N/S1HLYOSR2KPNfzsZ1EZEq02kCP2Kve7cN5Ko8F0PVRoXk2JdRse7yJiQZzLLj259Ru
         N22Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkKHUhORPsx1tnb9qW/tLiqLx50VLblxx1dKNomZn5U/Fgq+ZkiC+OsI5H7YMzqGXKZVzerypmISsDaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGjN+MP0Ai8Y0a3vkKdKJzzRkFv1xPqbzDZeGmeazIqzRKUczE
	DVISr/IIJDUmtpxFzsZnGvwLxrrEZw4Osj09LSrCWwmMhQ3yEo9XsZ8ryGVm
X-Gm-Gg: ASbGncsjQsbJL8KCxeRSOYIq77eZ+sIAhF6QEfoAxCmd0u4lmq6iVvpK7ap60iv16is
	Tcsjj43v2Ljr+Wl+DwbY6767SxImmKpzc+Uzg/eauyFTzNNnwMoVqS8Far81tqhLpeoezXsRk4j
	h7Ap9i6s9tK39iUFE4R36n1Qtt/YsVqCBtnTISk7SafvhZK4JDwhYzYgR5WSyh21d0FnNlsKfqN
	26mClJF7K9qFlW8xauTZNhsLurzfLG2DICth18jNy/0Txxw4+w6CF81FIOcvj1ofRfClhGYx+yE
	S9XTUcuVwxIXqQ==
X-Google-Smtp-Source: AGHT+IFgllpMHK2Mbm6BQMnFVJJ697JZ3mpkg4sF3gQMw0xoQtvshKIkHH0VoV1LFtHivU2mV0fdqg==
X-Received: by 2002:a05:6512:3049:b0:541:316c:99cd with SMTP id 2adb3069b0e04-5422953fe1dmr15239966e87.27.1736178528119;
        Mon, 06 Jan 2025 07:48:48 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542248cc8e3sm5033786e87.103.2025.01.06.07.48.45
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:48:47 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227c56b11so166689551fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jan 2025 07:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWygPvX1WdAYmHNMBgZ5cpyVGuBnPVUXGc/iZ+EpF20cRY9P2eSm9DMStVCzkMTGpTxsfCdQ+Cu1RWvUg==@lists.linux.dev
X-Received: by 2002:a05:651c:2129:b0:302:4115:b69 with SMTP id
 38308e7fff4ca-3046851f488mr190424841fa.8.1736178525182; Mon, 06 Jan 2025
 07:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241211222205.1915027-1-csokas.bence@prolan.hu>
In-Reply-To: <20241211222205.1915027-1-csokas.bence@prolan.hu>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 6 Jan 2025 23:48:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v66MgxCV+rNVC4NaXUFtxMk_=g+CyStLjpb=5e8Q0HNJLw@mail.gmail.com>
Message-ID: <CAGb2v66MgxCV+rNVC4NaXUFtxMk_=g+CyStLjpb=5e8Q0HNJLw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:22=E2=80=AFAM Bence Cs=C3=B3k=C3=A1s <csokas.benc=
e@prolan.hu> wrote:
>
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().
>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
