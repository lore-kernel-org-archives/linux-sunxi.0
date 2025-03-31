Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4AB1E1DF1
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Mar 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434730; cv=none; b=Oyp4Tm9We4EYovIW6qDP+tNTNt6saTVQ0EJne006SBp/4DXBIA0l+Gdw1aULgXtJSOk4NH4NYBEvEFgh8I9fJXsNk9ttCHV4enNVCzdhYrGBUINwWseay8VVYTmXgLnm9YF2lTs1/YtZD/kCNQ6TJYd4bqxqJc9Y2phKIpMmcSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434730; c=relaxed/simple;
	bh=Ss77VAHk8eVOAa8cwgXm9lkzs8JtRwEns8qC9n6KLm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+2KX3Ty+MLU8nWm2k5lOIU09ZyqCMXHfFi18P4oGRKhL5n4lxdvzLX30cXP9f4x/w+dslUsYG19IfJRgx9C+kWvXgBNR55CZrT2z8fNyb6FHD43v0jEzaX8RjG93hQvgZ+P4jb3gfT84raB88p6L7uadRqnbrMFv1y08SjBEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-549963b5551so4720166e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Mar 2025 08:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434724; x=1744039524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ffgl1EJ78XV8Ww8+yzDw7A3vtP3rI2eTTBEDeOFpPo=;
        b=TQ6T/E99DnDhDSdfVgXcT+finM8pZW+fCjUuaaQNe5pcUumAydZQSwwWZOk0k0qsk+
         pLxIygEMnte1uRrx9vX8mTjyhWpXfhqpqzsZBtFlnwMNiXDCsmlXeMyHEisnpP0aq6+r
         2w26Ggpq7t2uDhp8iYzuSqY3a6xWDFfiuwWq7TCEmYyzyRb45dVCXJ08HOKIoMlRKt3P
         2wujAilS1HWBvu+c/JRdGhyAHs+izcb1j7g9ifFgkOheK786QCC4Obc3pmlVhVwiqPCR
         nIKKpHerW2cQ0XqxxEzjlHnTUibN8ySgiaUtCWs7Bm30bslGwImTLnvImBRhLf6WaIHK
         VHTA==
X-Forwarded-Encrypted: i=1; AJvYcCUb98gIgIN6k1g1QsEsbrsbXkW3cVb2bEeX0sbtro42RnlPzy1cJz/JJPD8KvNpUcFuTOpo7jxCu60PCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF9QoqzAVHshZSlx8Lr+AynrNIzBV0/PK9vs4IttUF0+GETOgp
	PjNN3FgCdnRLiwogv9knvv/e71POlzbvWBGeKxQ+Z38Va6tR2g5YHTnwmtte
X-Gm-Gg: ASbGncuRAY69scrGPxqsf8dNxQ1z9tCzPd51MMqGaFg9gD0qo+6RqNGmi6LV/tUHhFx
	fIpaCA5KE139Q05KRCk9Nj/Fy1VBy66S8AUqQf9NtSsMCAoFPk69nYASzWIvbsxARj6WbaiIesw
	sAqPS4ESqbSo9/JquRHc54Lhm5olQG3zA9U4muZqDn1LNBt6XPs7d6+sY7bhd6y3OCsGd2x1pXY
	MNpiYjoL/lLB9AB4ZtKKUs906D0C149H4+DVd+vFV4sMmXBGYJueMfG/B9oB0PgXtrL7Y7j2IVL
	jsh/Ivo2oni+oLg1X2XGGKkiYTPR6alXcMrkLs/piZqWBlAKlpjbC3h9zEVnCXa2UQNu3UavUue
	Pzg==
X-Google-Smtp-Source: AGHT+IEPcubcugGrQBbdICUuykJ/jcYbafpNQ1cEqybvqpcYp4SfXos0CknEvRRpwL1qzyoQ9vKUvQ==
X-Received: by 2002:a05:6512:68f:b0:549:86c8:113a with SMTP id 2adb3069b0e04-54b10dc7dc7mr2182694e87.15.1743434723744;
        Mon, 31 Mar 2025 08:25:23 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fff0sm1152828e87.126.2025.03.31.08.25.23
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:25:23 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bef9b04adso46089111fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Mar 2025 08:25:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7oYMOa3G5hGjducI02rX2Ufxnii8sCIPLL7PuITNHP1Zfk11WK+R3AtF39aMCnahFgnaSTNKWJgXJ9Q==@lists.linux.dev
X-Received: by 2002:a2e:9a0a:0:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30de021a5e7mr27500301fa.2.1743434723282; Mon, 31 Mar 2025
 08:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
 <20241220120038.3137248-2-pbrobinson@gmail.com> <CAGb2v66enf0ybbyW3tW_YRdJB0=aOsXidm_bNHh=wdmm+HPBuw@mail.gmail.com>
 <CALeDE9MEBn+Sdi6VDPwv8KNqTGa3sUsvBWUStzg9eOTDCVi82Q@mail.gmail.com>
In-Reply-To: <CALeDE9MEBn+Sdi6VDPwv8KNqTGa3sUsvBWUStzg9eOTDCVi82Q@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 31 Mar 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v65sanUAiMNm+Brpm+p+r5PoEJe5cU6-3ES2w4+7BDUK+w@mail.gmail.com>
X-Gm-Features: AQ5f1JqaknCpQUGEiJLOOM81wDYjjstnDdXE6imvYdtIgyUSyVJlVKvFRiCt9rM
Message-ID: <CAGb2v65sanUAiMNm+Brpm+p+r5PoEJe5cU6-3ES2w4+7BDUK+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 11:16=E2=80=AFPM Peter Robinson <pbrobinson@gmail.c=
om> wrote:
>
> Hi Chen-Yu,
>
> Apologies for the delayed reply, preparing an update, comment inline.
>
> On Sun, 22 Dec 2024 at 17:19, Chen-Yu Tsai <wens@csie.org> wrote:
>>
>> On Fri, Dec 20, 2024 at 8:00=E2=80=AFPM Peter Robinson <pbrobinson@gmail=
.com> wrote:
>> >
>> > This adds all the pin mappings on the WiFi/BT header on
>> > the original Pine64. They're disabled by default as the
>> > modules don't ship by default. This includes, where they
>> > haven't been already, UART1 for BT and mmc1 for WiFi.
>> >
>> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> > ---
>> >  .../boot/dts/allwinner/sun50i-a64-pine64.dts    | 17 ++++++++++++++++=
+
>> >  1 file changed, 17 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arc=
h/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> > index 09e71fd60785..f04f0f1badc4 100644
>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
>> > @@ -35,6 +35,11 @@ hdmi_con_in: endpoint {
>> >                         };
>> >                 };
>> >         };
>> > +
>> > +       wifi_pwrseq: pwrseq {
>> > +               compatible =3D "mmc-pwrseq-simple";
>> > +               reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 *=
/
>> > +       };
>> >  };
>> >
>> >  &codec {
>> > @@ -124,6 +129,17 @@ &mmc0 {
>> >         status =3D "okay";
>> >  };
>> >
>> > +/* On Wifi/BT connector */
>> > +&mmc1 {
>> > +       pinctrl-names =3D "default";
>> > +       pinctrl-0 =3D <&mmc1_pins>;
>> > +       vmmc-supply =3D <&reg_dldo4>;
>> > +       vqmmc-supply =3D <&reg_eldo1>;
>> > +       mmc-pwrseq =3D <&wifi_pwrseq>;
>> > +       bus-width =3D <4>;
>> > +       non-removable;
>>
>> Please also add an explicit 'status =3D "disabled"', like what is done
>> for the uart below.
>
>
> So the status is disabled already because it's disabled in sun50i-a64.dts=
i, as is the uart1 actually, so in both cases it's not actually needed and =
will then just be set to okay in the overlay, do you still wanted it explic=
itly, else I'll drop the unneded uart one too.

I know they are disabled by default, so yes I still want to see them
explicitly disabled at the board level.


ChenYu


> Peter
>
>>
>> ChenYu
>>
>> > +};
>> > +
>> >  &ohci0 {
>> >         status =3D "okay";
>> >  };
>> > @@ -286,6 +302,7 @@ &uart0 {
>> >  &uart1 {
>> >         pinctrl-names =3D "default";
>> >         pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
>> > +       uart-has-rtscts;
>> >         status =3D "disabled";
>> >  };
>> >
>> > --
>> > 2.47.1
>> >
>> >
