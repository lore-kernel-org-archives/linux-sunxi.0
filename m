Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CFC25760
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736023685; cv=none; b=H4xTdJS7vrZxyKZ3R5t/3m18qfOXhgJTA6za72fw7Oqh4YxRjkpS10vRXX32AHiOkz2SAtKTuBGQANmRKdvm5AXCreijIUzBQWvIVr8XXsICE1VKLlUcauLy3dp6l0yYuEHBjsI+PGtgUQguzJjE7YJdw6E+QtnDYOJ8m5nCCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736023685; c=relaxed/simple;
	bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1tv3o8J42utPkes2sV1eSAnAC8nS1fOFCDOcDlXQv5AoP+XoVoyvpdaLn1rgesd3QPupQ1ast4dxB3HXp4a7m5RfghCPPgHIWbhhFjpSaM58F2WjGux4PiL+neV4spmM5vYPHzCOsnTKHfOWHHIqpevymAzr7Om5AQt3uEhZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecTD90xv; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecTD90xv"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-27d0e994ae3so5626497fac.3
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Jan 2025 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736023683; x=1736628483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
        b=ecTD90xvWpxamWLxJrsyCXqnKmThTqLaQq4t7CcGUxOY44cQsVeNbXfJlAkZoYLKrW
         n+/G6pG0KlKCS6kHU0XduxwZoY4yE9mHckaipI1CbTj7ZJeNtIRzY6kibH8s3nTFHqvN
         kKUYt6LY39GtBsZox55rnhXXh71WYnelPs/MaYQsLBhPvMRQayCLl96nNliAsHjVf8ly
         Lqt9fkX1f/vTwv4qzWYKxNejHYSinRq9t172P0K3YeSc02ZzRixw91jwgXerbxOdQEGp
         kyoq+ETrfyEfdTQXQhYeVSWA9KC5Ba4FoUaYcZOTNk7SJTyHMzGa/UTETrunbnJbdz7G
         MMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736023683; x=1736628483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
        b=ePXdFTNCFCxMCKOrv+3D2+mmTY8Dsib3nUlVbPyst9zhkZxOKrlUCDtwccpb7qpTt4
         6qPv9r+cw7iMw7dRiX1rFCDV+IFTDoLZBn8gnLqzFuHllqFrH1b8LjCy1zObUbF0/hzJ
         OXCoDOCsKy9AOx2NrM+SDtYUYqSsFMSQ9kXVwDLWWRJSntcRnJLVi2BjwoNXeSW949kd
         sCgcJBwuKqHofVdhSm5dMGsZNrly8DWf/9FlO7VE9cWoIareWIBIDp0zOiawyWJS8aRJ
         wwgNAr+ZQVC/jxYtFKLb3t3rUknxZg/pKJmLDNBF8Z9Xbx3GVomVZmSYrh4hlxSpdFXt
         HjCA==
X-Forwarded-Encrypted: i=1; AJvYcCWdxUlOsH2RbWclWIEWo/tinkv2WzLFi/+sQbbGy9yF0EHfqNd+75uMK4xEmbJU8ka+nvwkhz0xfmY+xQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu71UyFU25UC4nR4UxHztqjEb+u8/zJdchvDSySD4TzcidRpaz
	n0unkvbv1i0UmfH92ChOLSGlcfunR0M6/jZ0oZmjbMieQ0XcIpZcykVl/5/8UH9AbJfPcjSO+7C
	B5u1DTKacZI7FGG3lPlcbpA5qC2k=
X-Gm-Gg: ASbGncu51f5GMEaT/itj/tYWVIksOipgMGk1OgSYxT8unVk2ds881kE8aM6aAUILSD2
	lYzFH6WStkLotGXh5ItjA7DAR9lCptwKKL3Z484UbSLEgJuYW/A0x
X-Google-Smtp-Source: AGHT+IFqdpx5RJdOsRI9uR/s22I3j6REd5BbLNXwPDGQxQawZM2Yl0ffyE3R+tpVxSAwvtmyO4+f1b43CRGilnVUCkA=
X-Received: by 2002:a05:6870:2f09:b0:29e:3d0b:834 with SMTP id
 586e51a60fabf-2a7fb00b511mr31315329fac.5.1736023683128; Sat, 04 Jan 2025
 12:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org> <20250104120256.65511a28@minigeek.lan>
 <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
In-Reply-To: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 4 Jan 2025 12:47:37 -0800
Message-ID: <CA+E=qVdm5gf2+TL6ThaTdBy_3jPTSYdU6hj9Om9jPS=iyv8wMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: wens@csie.org
Cc: Andre Przywara <andre.przywara@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 4:14=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:

> > Yes, IIRC the C standard allows repeated definitions with the same
> > value. And I definitely tested this before (and hence recommended this
> > approach to Vasily) and it compiled without any warnings here.
>
> Hmm. Didn't know that. Good to know, and I just tried it on my end.

Yeah, I don't like it either. It's an artefact of pretending that the
device tree directory(ies) is a separate tree.

> Thanks
> ChenYu
