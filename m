Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3E93D63
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 19:03:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id k37so30249410lfv.0
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680289384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Op2hvo1QpmD4q1fBgDvpflzYt4ille90lJOYkm9McQ=;
        b=I9MBLXscoVftIVV9CjCEAHOLc8es0K+E7ZAIKRZSAuC79s8JCWAbcfd1/wUUY2D1HQ
         qqYcbYBp9j38efRMctWg4KhDrinDHH5RMfqVpMBTCL4Pk5KAEY8YYLgbdBmp5lNBd4WX
         WBc1Yn7iuEmqLxYw2OFLb+mQtYK5mlHl0JUwNLCzNVz+0GIhP2VGQ8Kctjbx/6443Naz
         LZCatuF8uyuce31qb7oKNBD0H88jyGp68xeFcevSTSVJbS9mpFdEBMKyuWIBKJiEr2z3
         maWg/ujFK92UZ5pkT8/UrO2C4mPvcUCyo0eGZRpGS2QfuAbUsDWyZRFIM1W4el2h38OR
         Ai8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680289384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Op2hvo1QpmD4q1fBgDvpflzYt4ille90lJOYkm9McQ=;
        b=ergUexjZESoXkFSb4Nw/8i3qMfH2l/nNoQnHG28iEc0Jrm9bIPLon2FT4mYydDDq/K
         ah85sb+ZZGi2cF8Sja1yGW3elm7ctKw6PoihusWhWVwuUsXgI9PSILxrDDy9kAewWYZI
         0Yn/J0+TPqhoCxODx4EiseCzpHPZ28aDF5NUn3LEHO4ZCKmwdUhD6/edTbpReQhF9jeA
         1CnT9eFW7EE640WP4jQqlZBAXif5Vl7akJNBM6S5AxIc08yx4ZqteILJ4xKSHI4IqQlu
         wXQIAIuEOaEQUCrW1BXfjfHj2JWL9/+CBfN+h/32lpY/rnn7v/ug6+tYwIU9qHsjmsa7
         VvIQ==
X-Gm-Message-State: AAQBX9e+u2THuYQzT8VY8q8EFFIRzt4lXVac1YUMlP2dqNxOwJwQc5UP
	Bhe+pkPxhN3Hi2xwYwQPAi5MDztELZSkN1ZY3C1Sqw==
X-Google-Smtp-Source: AKy350bg046U6kUEdMKJ47xgMoqU+o1btrNpujCJ6vXB3o551Lu3oiJA8WifEc5bExAewh/oNaLY16yV+c/9sUrBP2Y=
X-Received: by 2002:ac2:4470:0:b0:4eb:304f:66ea with SMTP id
 y16-20020ac24470000000b004eb304f66eamr823973lfl.13.1680289384305; Fri, 31 Mar
 2023 12:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331182727.4062790-1-evan@rivosinc.com> <25837ca5-b709-4d20-912b-ab13e6353069@spud>
In-Reply-To: <25837ca5-b709-4d20-912b-ab13e6353069@spud>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 31 Mar 2023 12:02:28 -0700
Message-ID: <CALs-Hss-W78x04LS7X_RiTmU19Xv6d3f4x5rgeEhV7TVy7_CEA@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: dts: nezha-d1: Add memory
To: Conor Dooley <conor@kernel.org>
Cc: linux-sunxi@lists.linux.dev, conor.dooley@microchip.com, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Trevor Woerner <twoerner@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:39=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, Mar 31, 2023 at 11:27:27AM -0700, Evan Green wrote:
> > Add memory info for the D1 Nezha, which seems to be required for it to
> > boot with the stock firmware. Note that this hardcodes 1GB, which is
> > not technically correct as they also make models with different amounts
> > of RAM.
>
> > Is the firmware supposed to populate this?
>
> Yup. Samuel intentionally did it this way:
> https://lore.kernel.org/linux-riscv/8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@=
sholland.org/
>
> Since I don't like using the firmware provided stuff to more easily
> test I do this in my u-boot boot script:
>
> tftp 0x54000000 d1-fitImage.fit
> bootm start 0x54000000
> bootm loados 0x54000000
> bootm ramdisk;
> bootm prep;
> fdt memory 0x40000000 0x20000000
> bootm go;
>
> Hope either of the above are helpful,
> Conor.

Ah, I see, thanks for the pointers. I've got whatever firmware came
with the "dd and go" Fedora image I found on the internet somewhere,
which doesn't seem to do the memory node population for me. I've been
hesitant to rebuild the firmware as I don't want to break the Fedora
"safe OS", and if there's a way to get mired in some build
environment, I seem to have a nose for finding it.

I'll probably just keep the patch locally in my tree, and if I'm
forced to update the firmware for some other reason I'll try removing
it.

-Evan
