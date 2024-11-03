Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA534430
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Nov 2024 02:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730602514; cv=none; b=tbTht8uai3SMP5QHyvO8azmxK5xUE+14BzniDZBkA/2lczKC9aEqsL9IS0EODEb/4W/lqSDZ0LmKDfU+fMFymUvbTz96NAkajf8FCrA1f5rlZHytxQkkQnai1TJevH50k6UgS5gKsPuJtH8ces7I+mJfA73iVSPKpXb7ywRVJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730602514; c=relaxed/simple;
	bh=Ts5mJgx2UPMaUYQQ1cD8EkIgBpOKjbKDuYhTB6/VNzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQDDdmgu8p8E7tsA5nDV+GMKHpxghve2bRP1KiYY7TJnYVY4DL/UWCW7XNAOdZIgn3R9UH8ZZmBSCUOGT+azb3TYOA0lg9TuUL1RSYLJdTBjfH0IuzFsBVHZNx6XChFYUroIs7F38A0yEMsZ5S/i/FOcg3LymXoK46V09sxDv4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so28410951fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 19:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730602509; x=1731207309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts5mJgx2UPMaUYQQ1cD8EkIgBpOKjbKDuYhTB6/VNzM=;
        b=ieuZUltIXj6XxuLllqCX3CYMOTTk7at/v9IJTa4i/IX422dmFKSkVP0RO4HKUBywjH
         3tj3WaOUS/Obh6B5GmU3As9xhzAcj1ub6is6kDtv/+/6k794+2E/KiuSFy+GP1kT8JfM
         mRbwvrnHj7V9YkRruOhmygoDqzav5fTy3NzhgwBztLRF6tbT2+MgPAJ6lJlcrALjiHgc
         mnFxAG8KPwcYIVcSyIMrjPmkiufuhpNBNsPSXDi7FCgAvRZroVsRk7hMr+tIQiSy3gd7
         5OaS/E3centoFpXvsJBDy8D8ys7x76U93huxri67QCZEyMt9+TeVDMvGiQc105TWcZiG
         toKw==
X-Forwarded-Encrypted: i=1; AJvYcCVseoJdN6tfIAn/cTlmRZfjgiZJ4seqFqLNgO1TO4LUDhHyeEXIvmN4GIPW6HMJ0vLS9g/Ww0XUZi8Y/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLTJ3NUQt2JSIIvdwXqub1nCS69GwUBtcHNp55lHGTszfJcDle
	gF7gL9WbWjvsydIWt4TuoJ7aWwlDoZ/HTdFeW6AAg6mKvkZxDLDHuAJdkpyzlkE=
X-Google-Smtp-Source: AGHT+IHqCWLI/vj5jZ1MWlWuWWTy2AO1HKhQL1wcJw7KaAt/Klv6KcRjmsmhK0JtfivrPVIzOXgTqw==
X-Received: by 2002:a05:651c:210f:b0:2fb:5038:3eb4 with SMTP id 38308e7fff4ca-2fcbe078dbcmr137215411fa.29.1730602508870;
        Sat, 02 Nov 2024 19:55:08 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8c9546sm11216811fa.125.2024.11.02.19.55.07
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 19:55:07 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso28870201fa.2
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Nov 2024 19:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXno4t+3+1Qn94tftEDwic5LyS9uZjGgfpBvgH/MDILENWKVrb11vDdhFpR6TJ7ZTV0xvdPn32EvuiBcA==@lists.linux.dev
X-Received: by 2002:a05:651c:1507:b0:2fb:5e64:327e with SMTP id
 38308e7fff4ca-2fcbe079c43mr115559201fa.33.1730602507670; Sat, 02 Nov 2024
 19:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-11-masterr3c0rd@epochal.quest> <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
 <36415ea50a5aa6cec8c5fb281af73f50@epochal.quest>
In-Reply-To: <36415ea50a5aa6cec8c5fb281af73f50@epochal.quest>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 3 Nov 2024 10:54:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v67RHjq=5DMiP8YtvOww5B8qJxCqF9ofGTXPUkmP-5herA@mail.gmail.com>
Message-ID: <CAGb2v67RHjq=5DMiP8YtvOww5B8qJxCqF9ofGTXPUkmP-5herA@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] arm64: dts: allwinner: a100: perf1: Add eMMC and
 MMC node
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 3, 2024 at 5:23=E2=80=AFAM Cody Eksal <masterr3c0rd@epochal.que=
st> wrote:
>
> On 2024/11/02 8:48 am, Chen-Yu Tsai wrote:
> > On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epocha=
l.quest> wrote:
> >>
> >> From: Yangtao Li <frank@allwinnertech.com>
> >>
> >> A100 perf1 hava MicroSD slot and on-board eMMC module, add support for=
 them.
> >>
> >> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> >> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> >
> > So I skipped this one since Andre had some questions about the previous
> > mmc clock patch. And I believe this one won't work without it?
> eMMC (mmc2) works fine after more testing, even without the clock
> reparenting patch (in fact, it appears to work more consistently), but
> mmc0 and mmc1 require more testing and debugging. I'll deal with
> the remaining MMC issues in a future patch.

I think it would be better if only the eMMC was enabled. Enabling something
that is almost guaranteed to cause data corruption isn't going to be fun
for users.

ChenYu
