Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40C717A2E6
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 03:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745553183; cv=none; b=rWU/MhnBIEn93ZWKQHkHDoQJPrCuKtwju6EXGx4a2L/T3JlsWManc95FwXQlBAPNwWz9VAvfKebonsGFwgrzuXUidE2C4HI5JxOuRZc7svY5+s4eT4tVDCAmX5EckcF7FceZrbRwvNblGYtDlszH/YHl6fJYq3evi/X7PLldbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745553183; c=relaxed/simple;
	bh=tMCG7PVJZT2ImV73Bv9BnKAx04gSVppKM7hgJ6w7nuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOZ2cMHB71RuP7wyRL1++xKL3RX9GREQN8YOTGzbdo15aeN+mK77IzCC4is//NlBvCe9gr1ljpIskU4Nua2mABIQdgjiIcjh+kUFptuJ6ICXzjSTPxdeGVfEmH86Df82aPQxbuNTA3uB7DVwj2Gmj8EfZTFzGE+9KOBzHDI+oek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54acc0cd458so2090220e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 20:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745553177; x=1746157977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMCG7PVJZT2ImV73Bv9BnKAx04gSVppKM7hgJ6w7nuM=;
        b=P3JidGVf6TWJpXZb9C6bdqYzSZSMo6UWflww7jpMNC0GjqJoTU/afmUFC3YKpJ6TiF
         XHjCgd1j7ozNIsNdAX9+xvulgCqGBNZzdqW7EkJiHXLogNCX5U6/s/adMx7Vb5O3fBDo
         LhOKPKeKB1axwuZskx3mcBxhE3ODXBLiaJoc4zXwlPMwZFe5fPVu7djRI6gGEUXHdzOa
         IvHBcqOW8o+WgJK9n7lOb8Bg7yeXsfRaDRPTnYnOnWsavbAGshIod3mjvCTzY9LkkkNP
         VdLs6ygc484/PJMlW0KOFeUWQd4NjLcC300yWylYC6hHr/Y2FbhjaBhJthH0wxPJnZCx
         AbQg==
X-Forwarded-Encrypted: i=1; AJvYcCUMimXKaZpB8TWv7SMBC9ehDezwNEKTgJ1S2BFSkMhJjo6tp8Th1rDDMkAH/g57gAe3NbeFwb113acXAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgWpM+3Vf8pJzNlp4krpWFGvtPhTeFKM6HLlYeES4EJbuJE1+7
	U4ob4RnxyeUzCYUW+zaiy5Qkc17LbRehnk7bKvZ5Nhomu9aPB5F3+Q7kJ+EU
X-Gm-Gg: ASbGnctaiAgm4FkB60M13a1OdhHor+2OOGNjgnlFh9w/GEPTpoCXg8fCgGMhYrLYp63
	o2vkczREeQYHvjPZi4tNcTLVdduQTW98LjhEawqnlEVPqpgcyATiwVMJHMhUW6CEMWdXZaa4L7b
	GU9J/kiyQhKYSxXRr5WUJVzIVq0tfIAnbI0cJ1+FR7MQAxSWKtuyMOZNacD0UiobjfGEtvTYUjX
	BYdSBhSTjvFUtB0s6tFhiFVZnFXjsZAvdEgzgIVpocdL1h8BGXit0lJ3kzyeZK1GTWPiu3QV2LX
	coXEHoz1GV12gBdnQuvyYkO0EPNudEQnP9F3eXL47qxKdYxpISpHQ3OIvB9gkJpst7X9lRHbXw=
	=
X-Google-Smtp-Source: AGHT+IGw2wZMjrHnnI7Yc3DyLl3Hc9ZYXpEecunhQHyNefQYDZrC5uI5880+GDmZQP9elkWHpQvp5w==
X-Received: by 2002:a05:6512:3c9e:b0:549:5769:6ae3 with SMTP id 2adb3069b0e04-54e8cbcda64mr204429e87.6.1745553176366;
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e8ccd3821sm85429e87.19.2025.04.24.20.52.55
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-317f68d0dffso15847761fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 20:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQ7Zh3ocKdhZQrNWXPVUuPHpm0Y0TMWpoNuzTjEy5nAj9V492aa/puTCBn33FDux/BUJJF9g8gNQatPQ==@lists.linux.dev
X-Received: by 2002:a2e:bc90:0:b0:309:26e8:cb1a with SMTP id
 38308e7fff4ca-319081da5e5mr1615191fa.30.1745553175817; Thu, 24 Apr 2025
 20:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425023527-GYA50272@gentoo> <20250425030006.45169-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250425030006.45169-1-amadeus@jmu.edu.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 11:52:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
X-Gm-Features: ATxdqUGezFuhR_KSYVB0KgNvKi6facsIdDbC9B14oLs_hkhyS0lMNSVl4JE789M
Message-ID: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
To: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com
Cc: dlan@gentoo.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:
>
> Hi,
>
> > It seems I'm a little bit late for this, but while we are here,
> > Can we also append 'cubie' to dts file name?
> > e.g. - sun55i-a527-radxa-cubie-a5e.dts
>
> Usually we use the device name (without the vendor name),
> maybe sun55i-a527-cubie-a5e.dts would be better?

I agree with this one.

I can probably squash in a name change (since I'll be squashing in the
SD card slot fix anyway). Andre?


In that case would you prefer to keep your current patch separate, or
squashed in so that everything is clean from the first commit?

It's up to you since you lose out on commit stats.


Thanks
ChenYu

> Thanks,
> Chukun
>
> --
> 2.25.1
>
>
