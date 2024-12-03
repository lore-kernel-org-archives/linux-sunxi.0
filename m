Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83796204F89
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Dec 2024 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733257461; cv=none; b=avkQgdYonOKi/zmzIGsKF5GX2QI98J2eRBG+cdFy7TEHS2j0ctKpXFhHI0i6i+v/stDXv+BsXTGh1B4nzd7fvXRQsFPQXgDysUy0pO+sq2kEjeuhXerrTN74cr/9ByicpLkfTFwyIQ96suLMAkvS+4V/R/rE6PQGs6SymUOtnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733257461; c=relaxed/simple;
	bh=bFuGV0xNSPrJGqtf1S1rSG57sqBxke0MPmO6wRCGEAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjOUNlicSe9YvRDf0CHYWF+ENkLCTZ+mAfBYBi91fI5fyciAHPh+iHc5BO+34cN+RaRZHhKqNXc5UEHSMdC3rWvMrLHkN6kZLcMcier1lCQNfPJSMQ8A+G1rNRl5ZHLJacFPRCnykPthtchr5zdKFiVJ1T2X4UV2r6UyQ/h/+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXuRfWbT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXuRfWbT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0c8ba475bso4861569a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Dec 2024 12:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733257458; x=1733862258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9H/VKKsxPqkwnn4Ovq0/TVybkjv9IaqZ2/k70fdkS4w=;
        b=nXuRfWbTCu6eyRvjvhijRIuyuXeCsYyDqwnx+30zNJHxCzxMqpy1tVVCluFNrRzWVz
         8g4MWhSWAeSfL6WIO9QD9HlEotH+jt4+WUCRRxF3hBZmxX7DybOBWdDSKSbFPM298Hgs
         hfZj7yUa+R+Y47skiEYLZX15cWrPSyMrciGSyZJw3s2Udrb8IA7Z/HjYNOfzEWfc7VsH
         r7nobjAHANILXar3uAJrJE9xSEIDzj2wtqIDgcN03fo18BnwvROFzIM5CHDjDZYPHZic
         vBY56lTl+Sd7PB/cxKyck+2HWyVHSaWolUci5HJR6b4g4DKODQRhasM2G3v3nHnORD8C
         Uhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733257458; x=1733862258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H/VKKsxPqkwnn4Ovq0/TVybkjv9IaqZ2/k70fdkS4w=;
        b=Oh7Y8i7MbKuNJWTsJq2suQlOB4Jc0nNpJQd979g+ssNMMBsU9M7Q9F5hbUA7xEznqf
         meVHnxR4ieK8jv6+V6N/nVoELxhuRvWQ2LUSj74mIqnhBfNMNqzpIaCim7qWz/lYHTND
         gG+sqmLngq7qxDUwUgNh8nNfRvfoPZRED1C1q7tl/ib7760ywI5fkDhGwL2UeFt1QefJ
         yvqTev1Co2s1vS4FbBjv10UI89getgNQV7ZoeNDtD8KJfj/rw5ICdZEAl+zzCN7y1qY0
         erv82u/pYf+PPz5sQuX2LPeS4Yqf5sK1Jq2eIsC0DoOpcEY1dUC+pAF9ikS+MlY7LRL/
         fIsg==
X-Forwarded-Encrypted: i=1; AJvYcCVuVb8oyujr0Lpb3bf5KITM4UXzgMH6X2RBd7EXObw1PDGAv9wODPFAbzHOm0qrp2EYCbjHZUJURU6Tew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5IpykKCKoe9PKbdX7x6Jldsj/xR3thewoZSH3ooSm78paK/g/
	VS94bxSyOv6kjbc6pAmhxTo3fdeF+59RvFrZvNc8IEz4hGmLuIFdGVMvUqE2+5lz3uLyOWDk88C
	Jlf95ayXwApeC70NJbD1Si8md1WIVM5locS8=
X-Gm-Gg: ASbGncueHiQcpiQVToIvapqQNYAUjtQpvGWtuU5gxusHy9AwxHBG7jaVMlSpJGp7L/F
	+jHg4bFnoCwY9NILTnNJ+U8QZEGqtpE2f
X-Google-Smtp-Source: AGHT+IED64HAONqQrir/0SLtu04gZNnEVK81RYiQzhjfvbIpkN0hS/WjQiGMGqysENw73UqcV2tjL/kgzHI8NZJANkI=
X-Received: by 2002:a05:6402:5216:b0:5d0:80fb:87ba with SMTP id
 4fb4d7f45d1cf-5d10cb5683dmr3904970a12.14.1733257457782; Tue, 03 Dec 2024
 12:24:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241128154556.2743839-1-simons.philippe@gmail.com> <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
In-Reply-To: <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
From: Philippe Simons <simons.philippe@gmail.com>
Date: Tue, 3 Dec 2024 21:24:06 +0100
Message-ID: <CADomA48EED-yfwdR8O+3Xd0YKzn=QodECfmdiuFUu9YPWn0GdQ@mail.gmail.com>
Subject: Re: [PATCH] Update H700 opp values
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It seems I was looking at the correct source of instabilities, but
not with the correct solution.

incorrect cpu voltages were indeed causing the crashes but only
because the cpu regulator was missing the property
regulator-ramp-delay. The patch can be discarded, I'll post a new
that adds the missing properties on the regulators.

Philippe

On Fri, Nov 29, 2024 at 6:13=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Nov 28, 2024 at 11:46=E2=80=AFPM Philippe Simons
> <simons.philippe@gmail.com> wrote:
> >
> > My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
> > especially with some OPPs.
> > Crashes were fairly easy to reproduce with any dynamic cpufreq governor
> > and some load on CPU, usually in matter of minutes.
> > Crashes manifested randomly as simply hanging or various kernel oops
> >
> > Manufacturer (Anbernic) is using more conservative mircrovolt values,
> > so let's use these.
> > While using performance gov seems stables at 1.5Ghz, it still crashes
> > using a dynamic gov (even with Andre reparenting patch), so let's drop
> > it for now, like manufacturer does.
> >
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com
> > ---
> >  .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/a=
rch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> > index dd10aaf47..ac13fe169 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> > @@ -50,24 +50,21 @@ opp-1008000000 {
> >                         opp-microvolt-speed2 =3D <950000>;
> >                         opp-microvolt-speed3 =3D <950000>;
> >                         opp-microvolt-speed4 =3D <1020000>;
> > -                       opp-microvolt-speed5 =3D <900000>;
> > +                       opp-microvolt-speed5 =3D <950000>;
>
> It seems that you are encountering the issues on this particular binning.
> Could you mention that in the commit message?
>
> It's not very obvious that H700 =3D=3D a particular speed bin of H616.
>
> ChenYu
>
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x3f>;
> >                 };
> >
> >                 opp-1032000000 {
> >                         opp-hz =3D /bits/ 64 <1032000000>;
> > -                       opp-microvolt =3D <900000>;
> > +                       opp-microvolt =3D <950000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x20>;
> >                 };
> >
> >                 opp-1104000000 {
> >                         opp-hz =3D /bits/ 64 <1104000000>;
> > -                       opp-microvolt-speed0 =3D <1000000>;
> > -                       opp-microvolt-speed2 =3D <1000000>;
> > -                       opp-microvolt-speed3 =3D <1000000>;
> > -                       opp-microvolt-speed5 =3D <950000>;
> > +                       opp-microvolt =3D <1000000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x2d>;
> >                 };
> > @@ -79,7 +76,7 @@ opp-1200000000 {
> >                         opp-microvolt-speed2 =3D <1050000>;
> >                         opp-microvolt-speed3 =3D <1050000>;
> >                         opp-microvolt-speed4 =3D <1100000>;
> > -                       opp-microvolt-speed5 =3D <1020000>;
> > +                       opp-microvolt-speed5 =3D <1050000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x3f>;
> >                 };
> > @@ -93,7 +90,10 @@ opp-1320000000 {
> >
> >                 opp-1416000000 {
> >                         opp-hz =3D /bits/ 64 <1416000000>;
> > -                       opp-microvolt =3D <1100000>;
> > +                       opp-microvolt-speed0 =3D <1100000>;
> > +                       opp-microvolt-speed2 =3D <1100000>;
> > +                       opp-microvolt-speed3 =3D <1100000>;
> > +                       opp-microvolt-speed5 =3D <1160000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> >                         opp-supported-hw =3D <0x2d>;
> >                 };
> > @@ -102,9 +102,8 @@ opp-1512000000 {
> >                         opp-hz =3D /bits/ 64 <1512000000>;
> >                         opp-microvolt-speed1 =3D <1100000>;
> >                         opp-microvolt-speed3 =3D <1100000>;
> > -                       opp-microvolt-speed5 =3D <1160000>;
> >                         clock-latency-ns =3D <244144>; /* 8 32k periods=
 */
> > -                       opp-supported-hw =3D <0x2a>;
> > +                       opp-supported-hw =3D <0x0a>;
> >                 };
> >         };
> >  };
> > --
> > 2.46.1
> >
