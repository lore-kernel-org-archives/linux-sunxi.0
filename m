Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90212DDAF
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Jun 2024 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423807; cv=none; b=js+orREgiJLuKbWRy+sTGJve+M0/5R3faZwgMB0QrCHz2+gPTirh2BVn8Cw2Tj4d8YSwfJhlUsTbtXBhO9KRR/BpoKM9QO3166w3jTyR+gRo48+KTDvQ6ox4AHgVhVi8E0g8M4xcH0RnOCShoIasxUyykljiXGgNqODQ7UpRnRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423807; c=relaxed/simple;
	bh=wuG+3NW8bqaNoU364YackQWUvNgGC60GynXWWgakw10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cC8JcJOBtEEaC6qUehyYheHNgoo7lHGCUGKfrlK9STgYUw1Nwrauz/n8m6C8X3beKURoLW/82KyWcxpeMFad7ohMrUJ4DeUwOh0kknAMlnAghWhDRk1r2wHP7qS4GzfZzKt9DSyaQ/bLlde5l4Xdtazl98Px68265yZYhLLw7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52b936c958dso2249459e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Jun 2024 07:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423804; x=1718028604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ducoQxeYzOenka+9UKfZRV7ZnNiMHeFLcXvUrioG4Cs=;
        b=Gm5YlUXmt/lt7mdSWeS87SiuiDIOGKcBwlbx1gJhiZ7TJ/cvDQdRXkENAqWs1wV+kW
         kGfsi2270Aef4oVsYtNzjPrj0pAyagswE1WKAK5UukXPiYlLuxu42I4NEnEfTyzTj4KR
         OPSr2fIcTuUJ3GWAVBVY/KehI6mw/YytuoXjBTlyahtHNbS1dX73cwDdtMfplyJAYoVp
         rfZcDW5sj2zs1K567qiElqxCBaLKpXxFA0CqKGPHNEcDIVWbvf8OZi0uE78V8PGzXzgQ
         n+D67Nnn7srjvHFipL1tb3bvMbp54pszkE+lRaybQfv7KIX+X2C3LtFFD8BuNYoEA7Gu
         oMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFxeQSIZDfca4PhImOZrnOG2d0T+IjNFvkM48DBUsFSgDkNQ4SHPg5qrA4hJQ1Iupf3wK16/VjKHXloabnBELS1CW60NO8Hq2WGHk=
X-Gm-Message-State: AOJu0YzU0L+TPY+ZrroqYk/LXf8T0Nez2B//78xKrV0KvgXH/FERSRlR
	n7olHOycR0oN6yTLqjIlGLOBi7GLNvOyG10aOaZapGW8FIjXQvLWGjfIqp3B
X-Google-Smtp-Source: AGHT+IFxF/Cr7M6PM8NE86/UYETO36CNW6KCmxwBB81Wbu7bfM1vk7fo01uJSKlhCVl5Leirh1kT3w==
X-Received: by 2002:a05:6512:b9d:b0:521:7846:69d1 with SMTP id 2adb3069b0e04-52b8955c4ccmr6744621e87.6.1717423803581;
        Mon, 03 Jun 2024 07:10:03 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9e9a4f7fsm116417e87.9.2024.06.03.07.10.02
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 07:10:03 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e964acff1aso47962891fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Jun 2024 07:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5OxIQaX8BVFj3x6m+qrKEbxjl4XtcGhnljjKR1d34xI5S/fWqaIz/OmBmGyJCYUwK7NJ8DVgy+p8jPiM4ZkEqISf0BhBvI64p1oY=
X-Received: by 2002:a2e:a986:0:b0:2e3:186d:45a7 with SMTP id
 38308e7fff4ca-2ea9512c9a6mr74129451fa.22.1717423802592; Mon, 03 Jun 2024
 07:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240320001152.4077150-1-pavel@loebl.cz> <171742366735.763275.121443280080030531.b4-ty@csie.org>
In-Reply-To: <171742366735.763275.121443280080030531.b4-ty@csie.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 3 Jun 2024 22:09:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v66TCz2XJgc8yiUmVj++2Jq1=KdmRo_3LuHgHaQhB=QEFg@mail.gmail.com>
Message-ID: <CAGb2v66TCz2XJgc8yiUmVj++2Jq1=KdmRo_3LuHgHaQhB=QEFg@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] dt-bindings: arm: sunxi: Add Banana Pi P2
 Zero v1.1
To: =?UTF-8?Q?Pavel_L=C3=B6bl?= <pavel@loebl.cz>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:07=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, 20 Mar 2024 01:11:45 +0100, Pavel L=C3=B6bl wrote:
> > Adding support for Add Banana Pi P2 Zero v1.1 from Sinovoip.
> >
> > V2: Added Fixes: tag to 1/3 to reference the commit which introduced
> >     the duplication.
> >
> >     Fixed all issues found by dtbs_check, except "cpu-hot-limit" regexp
> >     which is there for all H2/H3 boards.
> >
> > [...]
>
> Applied to sunxi/for-next in sunxi/linux.git, thanks!
>
> [1/3] ARM: dts: sunxi: remove duplicated entries in makefile
>       https://git.kernel.org/sunxi/linux/c/bba474656dd8

Pavel, can you fix up the comments on the last patch and send a v3 for
the two board patches?

Thanks

> Best regards,
> --
> Chen-Yu Tsai <wens@csie.org>
>
>
