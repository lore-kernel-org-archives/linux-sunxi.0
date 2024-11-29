Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C15155342
	for <linux-sunxi@lists.linux.dev>; Fri, 29 Nov 2024 05:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732857210; cv=none; b=aX+pIptbqw/Ct/ru/hr7e55G7VmFrrWiO1Isq/QXRfb8I/R6hewE3Ea7k+p4hOjegq4ZIJfrBYMz0GHqTGBxkgPD7BcxrDE6lzgjRM28cXuAwBCpw6Dlmt+G8SU+gYjPKzXfqUE7F3D1mq7fh94muKE+v/Ry9g8xfJ3O/HIjvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732857210; c=relaxed/simple;
	bh=+12xevKnTNauiZYg0olJVZ1Thq3/ybq5525r9lkxdSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aN5o3OhcOLG5cUavhlmcGZMOmh8j5Fv3I7ei80IdilPwoYV/zsQYK4UI0eTk4dURmQFSJMIlLj6lVCquR4ntxQ49swAJNmtNcvsJ6kvcoqfrCCgwbHi2V3WDBwFXHuKKf5Ob0C+gdGHSg4wpRCLPXOg95PvmBKfbmykgLxm3m2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffc1f72a5bso14999101fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Nov 2024 21:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732857203; x=1733462003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJvwqiaal1EaQSpBB0Sl+EHlw0k4hE//iJpExas7lYg=;
        b=nQsUyXociSFUYfx0dXbWkZdoO5GAmq1q6Y3vKLzgRg21QKCLykEPRSRbOsXJSUZF5s
         XVnckFRfUXbotYZU5uM1i36pXDbNw4Gzddn+8mdL21h6zVauSf4x7Mo5fLwFjncSudXH
         HtpM44TpbcFWhI3w1zKBqX9GCdvjTvaa2P7AlMBfvIvr4HqXBpGPZf7BK2szuw+QS/07
         xGpa3hnnp0zfnQV6tk78CxfY3WanqblzGN1YSa1HsdSJC5SrxJ+gQnCnokDJQevN0KLQ
         wPF4hM3jtEASAe9SeTAvOp/Ju1IrcMdWUXczUlW5JPm+vSS72g9tGdi63afawTmWhN3S
         834w==
X-Forwarded-Encrypted: i=1; AJvYcCVbhmU8LQrnSI4vWYZjYi7l2R9e+iVG3nowoSgBCcjyp/GlIJnnUNEkNYLKRJF40I05cZC6Jj/MnQDxXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1bnUJ0tZtvIe3akWw8h9q9dz04lMvkxqVRKw4+j5qeTEUY3WK
	oiFk5sU4VYYJ287ikmvU68wD2kLERONkUQLmObVc0fpknmSG2NNTRVuooXLJ
X-Gm-Gg: ASbGncu55OUJZ1RR144EqeTOdcmILoq6E2bjqPZca39bwXq13A0l2BElaL5rdZd296R
	YLADEON30ta5LJ0YoMFC/C6AstQh2XaGi63FSh71g3fLnImLA2qY/YcC4eS6OblaI0NifVZxpWx
	6bRp/QNiVHnB4f9nGVPRDXLNLCWnP9iqKQ05BLclPFLc9NssFHgLVL8Mb185+WcSnNWjt2Dtqyh
	6/pKJ8hrITP6iPcfhvyVREM6AMZMOsG2/ynjV8B9SlIdeLZV5KMqAMt6czDfD4qgrpsIBz9qY5I
	x7TED2w=
X-Google-Smtp-Source: AGHT+IF6ysyD1aGhRoHTAcs/e0w4QJ83rCXgPWq/NXIvpjR8q6+u/Tx+vg5aDWJfsNjTxC3f2+zBxQ==
X-Received: by 2002:a2e:9a11:0:b0:2fa:d086:bca0 with SMTP id 38308e7fff4ca-2ffde203ebemr15247931fa.10.1732857202917;
        Thu, 28 Nov 2024 21:13:22 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc745f2sm3422691fa.90.2024.11.28.21.13.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 21:13:22 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc1f72a5bso14998521fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Nov 2024 21:13:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwHCVdC8l/8DtiqkT4TnEFbhSHsCRoD3VEJgSuzWJtVNkGK/27tTd/HeIkv5Fjoha65NF+Xnpbd9z8Dw==@lists.linux.dev
X-Received: by 2002:a2e:9687:0:b0:2ff:e54a:cd08 with SMTP id
 38308e7fff4ca-2ffe54acea4mr7224861fa.3.1732857201437; Thu, 28 Nov 2024
 21:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241128154556.2743839-1-simons.philippe@gmail.com>
In-Reply-To: <20241128154556.2743839-1-simons.philippe@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 29 Nov 2024 13:13:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
Message-ID: <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
Subject: Re: [PATCH] Update H700 opp values
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 11:46=E2=80=AFPM Philippe Simons
<simons.philippe@gmail.com> wrote:
>
> My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
> especially with some OPPs.
> Crashes were fairly easy to reproduce with any dynamic cpufreq governor
> and some load on CPU, usually in matter of minutes.
> Crashes manifested randomly as simply hanging or various kernel oops
>
> Manufacturer (Anbernic) is using more conservative mircrovolt values,
> so let's use these.
> While using performance gov seems stables at 1.5Ghz, it still crashes
> using a dynamic gov (even with Andre reparenting patch), so let's drop
> it for now, like manufacturer does.
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com
> ---
>  .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> index dd10aaf47..ac13fe169 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> @@ -50,24 +50,21 @@ opp-1008000000 {
>                         opp-microvolt-speed2 =3D <950000>;
>                         opp-microvolt-speed3 =3D <950000>;
>                         opp-microvolt-speed4 =3D <1020000>;
> -                       opp-microvolt-speed5 =3D <900000>;
> +                       opp-microvolt-speed5 =3D <950000>;

It seems that you are encountering the issues on this particular binning.
Could you mention that in the commit message?

It's not very obvious that H700 =3D=3D a particular speed bin of H616.

ChenYu

>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x3f>;
>                 };
>
>                 opp-1032000000 {
>                         opp-hz =3D /bits/ 64 <1032000000>;
> -                       opp-microvolt =3D <900000>;
> +                       opp-microvolt =3D <950000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x20>;
>                 };
>
>                 opp-1104000000 {
>                         opp-hz =3D /bits/ 64 <1104000000>;
> -                       opp-microvolt-speed0 =3D <1000000>;
> -                       opp-microvolt-speed2 =3D <1000000>;
> -                       opp-microvolt-speed3 =3D <1000000>;
> -                       opp-microvolt-speed5 =3D <950000>;
> +                       opp-microvolt =3D <1000000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x2d>;
>                 };
> @@ -79,7 +76,7 @@ opp-1200000000 {
>                         opp-microvolt-speed2 =3D <1050000>;
>                         opp-microvolt-speed3 =3D <1050000>;
>                         opp-microvolt-speed4 =3D <1100000>;
> -                       opp-microvolt-speed5 =3D <1020000>;
> +                       opp-microvolt-speed5 =3D <1050000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x3f>;
>                 };
> @@ -93,7 +90,10 @@ opp-1320000000 {
>
>                 opp-1416000000 {
>                         opp-hz =3D /bits/ 64 <1416000000>;
> -                       opp-microvolt =3D <1100000>;
> +                       opp-microvolt-speed0 =3D <1100000>;
> +                       opp-microvolt-speed2 =3D <1100000>;
> +                       opp-microvolt-speed3 =3D <1100000>;
> +                       opp-microvolt-speed5 =3D <1160000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x2d>;
>                 };
> @@ -102,9 +102,8 @@ opp-1512000000 {
>                         opp-hz =3D /bits/ 64 <1512000000>;
>                         opp-microvolt-speed1 =3D <1100000>;
>                         opp-microvolt-speed3 =3D <1100000>;
> -                       opp-microvolt-speed5 =3D <1160000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
> -                       opp-supported-hw =3D <0x2a>;
> +                       opp-supported-hw =3D <0x0a>;
>                 };
>         };
>  };
> --
> 2.46.1
>
