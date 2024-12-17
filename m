Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A61F3D55
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442911; cv=none; b=jbAmdck4oE4S8PJCFlFqkJYhX/uF/2AlX+j7C2z8KOqlUXA7RbXbtU4RS6gh7Vo6S4ecBKCP3hADXKBb8cSQ04LwceG60B36i7hOwSoHRJNpnnrUl/1WGLqrptOG0G3XxkBxX2GwjOejLhB/Vp2zvkmvoPnBnX0l/IFAWET5BJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442911; c=relaxed/simple;
	bh=OQPsyR7dAWj0HH5X6ewchiw1dxigQ2xEs+aOiFD7V1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6KHjh7vZuMPw7HQ7HgD0zxXAaX8ZjuMlbUP4FNgNikCH6iGu7N058UUCPYliF5OoVdcmGpnYuUMGhjhJbfJrUYhNoGIOUpSXSK08FwdNbqGoYvls1BzfYKRHN87/yqQn9UeC1HSZsPZMTuAzv5hH3vO5X6cRZ7tW2bvWd2+ghI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNqrpEvr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNqrpEvr"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401be44b58so5338378e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Dec 2024 05:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734442908; x=1735047708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQPsyR7dAWj0HH5X6ewchiw1dxigQ2xEs+aOiFD7V1I=;
        b=JNqrpEvrkFGteoDRbkT8B5Z187c26aUKtyKaEirF8u2rn4qwO7GQ2ST8V+X8Um58UL
         v7Z6bZM5XsxYnpQvLqyp64hyT/BBkEhO439xmMTpC0+ziVtyt9uWAi0ylohv4WAJTiUe
         AB7MScfisudAuD+MPSDR1NEuTuWRgaS5Q3JDVKsOCUjzGGE5W/pk9NlpLPiZDa8cSNV4
         od6DQ7+lwVtFriaAY0pnAhCicEsOZQ2XbdABWrLCHHyYVq6XpnxcEMGBwV9z5pAfvBuS
         +ESICaXYxtCWsVEgn+q/IGjpl4o3g8RSCy3OeJa0v4leRD4L1sxT3lsNOmeUmSPFsKZf
         gQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442908; x=1735047708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQPsyR7dAWj0HH5X6ewchiw1dxigQ2xEs+aOiFD7V1I=;
        b=cykccY4ZCmeF5ZtyK1+o6I38lBFPYfOH6GNWw9VlxiQ/SoazZ/9IieVxDBP2JD6bHn
         jcBTenlaQt4bEfqZ9D/bxjnpqB5QL2k5GCDkG3W6ZXUG7miy2AwQ4ydqcApMvDUXg+mE
         7cLogPwYmjRzxy7J9t+6yZI8ecgChmiU4gXHSJd3ZX8ouoPo/fyogaRxKlkvxyaSu+ut
         B1IsFb714pQy1i9sivn5ObAP2qjkISe7SHL7UOncJA25TAiDlr4cwtt7rB5QEy+hj8c8
         g1ZCu40bpRlCNPw8WbsnnfjCtDXsZLweQGfuUQ/tdJvj9qI0KatbhQDsqxTYnBpknOx4
         QUMg==
X-Forwarded-Encrypted: i=1; AJvYcCVexk3C4eTfGGt+ZafcB7r7AR+iSVjnp3TULm+fhVFxQdq3wV+pYugu1Tl1ew/exhNDDejCp756Rp8lyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWzvBDAoY7k6jlYFg+ok2V9Lv9A4KKPxNki5wiGXCGY+NfJArZ
	jMLA0AEOz6x4pZE71cFFkGhT2V0ELl9LX02IU+DMiuOvj3bG+f6A3Doofm6MaewdmQSxvAKmmvz
	gz+LNBqfW4oDd5OrVHMdLwvlhlOxgoBsdivufRQ==
X-Gm-Gg: ASbGncssmSeh1a2idSV/omAqRARsrz9P10b8m4jqJ5SjCuZslKw7e60rx8IekRPl0yo
	grqOW1Hh94eqL04RR+Ke7BDf651fKVfrBvDERsQ==
X-Google-Smtp-Source: AGHT+IH4HRXYBmosVzpwGFebPuano60MtISoT9J69VFwW0An/ivv1V9rgWffgN2jJxOLz0JsvxSobN0rBrRAtASDJGM=
X-Received: by 2002:a05:6512:3c85:b0:540:20b8:7325 with SMTP id
 2adb3069b0e04-5408fac7aeemr3900258e87.2.1734442908199; Tue, 17 Dec 2024
 05:41:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119140805.3345412-1-paulk@sys-base.io> <20241119-prudent-jasmine-lizard-195cef@houat>
In-Reply-To: <20241119-prudent-jasmine-lizard-195cef@houat>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:41:36 +0100
Message-ID: <CACRpkdbcDwJaLmCa_YoP2zFw3fiWn-d1Q773jGh9kcVN8aWQKQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <contact@paulk.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 3:43=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:

> [Paul]
> > The pinctrl code supports an input-debounce device-tree property to set
> > a specific debouncing period and choose which clock source is most
> > relevant. However the property is specified in microseconds, which is
> > longer than the minimal period achievable from the high-frequency
> > oscillator without a pre-scaler.
>
> That can be fixed by introducing a new property with a ns resolution.

Perhaps, but I think a setting of 0 should just yield the minimum
resolution in this case, as apparently the debounce cannot be
turned off? This would also make sense to expose for
gpiod_set_debounce() as explained in my other mail.

Yours,
Linus Walleij
