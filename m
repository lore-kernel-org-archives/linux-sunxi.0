Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5447CC67
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162556; cv=pass; b=HiiGgl39cMhrYjUCazGGzi5R5ryRrF+90vngUfnreyDlAaRgp0pm4A7XLK1+WAqLQ1cozUIcDQG2Zs3Xc1ngqlgYnAoRl+TMerFS2pKiAMrQtwJt1nK2ZX9yw8j7F/UnsG35eD34K1z8/TGD3BhSEwBZrbhTx+BwkLTol3jmNx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162556; c=relaxed/simple;
	bh=aslJG+w3cMQHAWQW9rbg0eDe2JUIpTkkt1yvgS0DwGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sis17umPH7dVXLWOqLcUmupkmbs2jNgF63Rmbiw4dX1mdjwcvvOXQv9tqGduxiS9LUjS2groEC5jMbvhOL68JPb48V5a84NYfHitMmt4tZfBosxTtB6RTftmtSKtAfkIhPjd61qONt8A7v0CsP8CONbSfG3shkDrbEcRth8hxJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3cxrTVv; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3cxrTVv"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530c602630bso10761911cf.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162553; cv=none;
        d=google.com; s=arc-20260327;
        b=YU5v7M4aroBGEdmcalBjMZzbaTVINf3cxXat3ngxN6aLUr0PYAddLA0YA1ovnKbMWa
         n88INHbdRSXltFsO7rP6aw57BoG2YGxJeVbwelp8r+OpI8EcOCsCWAegLdJIXCVJDMQC
         eeX8+njf2xd2wRA52thyAJw6YkkrPIJc3vycBNFM0nIYH3mbepkRC9UTeQiCpPTmqoq+
         LBiY1BbI9GG4Va2R9+9FmggTFJvYLMx30H0hdieKjbhK1CR4zjzWGn4tja8zRyXyAKAF
         Rpg6Ov7yFtFMJKsDjxgRxNV39L39V2jcdrW0YjCyx67rGR8N/jxBmLUWuH8fCJdOoCH7
         T9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        fh=M9MHb23fWnKVTpF5h44hEGJn4kG+u/6AoOe+7vXBQMo=;
        b=WL1cnYEIjFqptOWSHXulDcbzLVRXNyRs1R0xVQ6Aw7YrPrAvN8l5OwakMvAiSJG4Ms
         p39ZmsXFiwI7vsLoRAJRV5v0O3b1J9Rm/li4B31QEy0gqNDy7+CJZjwDTAZelWWJN5Tq
         wXDkKpFb/wppj3HUUS50YGqqVULELe8iYMtPqiXqw5RUPC9PN6J13mhFp+AFXAn+zk8o
         b3TF90Y8+0heqpVppQW3geDk8KvnW85NLpDteqK9XKJ0OWcNZamBjHabfuoggTXXnnhJ
         zgpT1dCe7RKalWu3Cbdcw93E2PiJyDfN47a7A/guuW11jsS+2YlbUb8AGcqNKMN9vmNq
         N9qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162553; x=1790767353; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        b=h3cxrTVvBWJoCwGWK6QLhJAwVME5yQpXue8jWh3iCyltNaN+hk/JZ42vpLcL3BZhl0
         g0lt7kA8S2wpFzuHOahM6beyl95yZPLLLZSq78huR+x8RoFAJ2uum63Ust+9wTw522V3
         +1ykb78ppABfkn/E+2+2W5OcSG3iu2abgw7MZhUZDJDWJpS520U2suw3U3Scspe0h0Hr
         MvDuqxpCtofCUolTAF18YFYafNMaQypJAK/gebsxjGCZj0J+P/jKD1+uBpZPScIjWhNr
         I9BE69VUa1hqjpPaTMhS4gowbZz65E6DxmqyMpQbVs+n69NYWgkaufFBVeDn1HnlFb+c
         sIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162553; x=1790767353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        b=Ikv1PUJ8whhsK5BrzfRY+W73jeBAb60+XqE12t4Uj2ZrsUAASkfJ6NTr9Pw1C3gZ36
         PRRAXwhKyujP6Lm/VxPRXTorRX/n+orRxGFl2ju9s5BdKJgxcf57hQoUfsJjjTq/pJGj
         2NBkhWEazwxZcY4mrDdKlzfWYuTaMi7zdw1A01L4ceHh6ulukXWgGJtC9Wd3EW2GzCgI
         aifANLog1nLSif3NCZUuXfrm5RmkqZ8Tw+oHZw8JUThLNPQCatGy2OBmH+JXw2ak2e5I
         jOlOC6Ly84ZKUoNu73QTLyERZ76tergvb3w43e2iZBWzRlUtSkNMH5oIJLEe86D2t7GE
         Tk+w==
X-Forwarded-Encrypted: i=1; AKwUvBynRCHclcGYSNLznDoVzFEAvzDZHp3FnnogJ+XAd3aMnDxuMhDAG0xgvNjO79si+5kmcHKickm+2MuLtQ==@lists.linux.dev
X-Gm-Message-State: AFuF++ly3B1rEPgVWg2Fw0fNOvsPaeulnXWY1GpuKnX1SUiSaa2tO3rI
	kqnzkMKHYCRQz/d9lWIrnzBTsmDC85zSsDTnbT0DP/c51IsQrcx7sCpwNlRXiOgTqQGJAmonCnA
	DfqjnBmSU9r+1d2BqEFy3CfKqhmoaK/M=
X-Gm-Gg: AYBFou0V5Eb5iCRG7RJh2E/A0Z170O30aurPV+xxRMwz7PPKPsT7CZ0tMVMsN9UorZd
	UyPxRSgnmPStsCTezw3hXThIyhH6KCaZcC4b5Q4jBasMkcyJ+sCS4t/k7kvcJEXjs5vNdDaJCch
	lBjLxCewhNC0+b2xK4sLiRKgPp2PJRmlD34QHuOUq5NBi07PmRWyWgfZM+EKkoKxzh8HMUGZ3TS
	Ax/nLWRWyi6rRC9egN37VohORfqMdlVs3CKVPC7F942mcoHdwZrjzpdH6ZrUPvPYnp56z8jdS0c
	kwLfBWXM6RYkE+hcdrdtJBN+81ofXq5Pe60JyCHNBR14gpCCRDcqFJzdSw==
X-Received: by 2002:a05:6214:2e48:b0:912:5ac0:861f with SMTP id
 6a1803df08f44-9140c1b0f18mr35187016d6.0.1790162552706; Wed, 23 Sep 2026
 04:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
 <CANHPwARNHjh92DFd30rdbkqzGw6jhQQoKdQhHUx09gTTu1C5YA@mail.gmail.com>
In-Reply-To: <CANHPwARNHjh92DFd30rdbkqzGw6jhQQoKdQhHUx09gTTu1C5YA@mail.gmail.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:22:21 +0500
X-Gm-Features: AclHuK-G7kblUAb1JNixL0kLwSeuWnesiMXkdWuZUry8w7-I-stza3Or0Pd8q9U
Message-ID: <CANHPwASywA3B6M+q8STWrVbknjXHywu8jp9ePS-DdqgAVv-v9g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review - you are right. The two buttons and the IR
receiver are on the optional 24-pin expansion board. With the board
detached the LRADC input and the IR receiver pin are undriven and
float, which can lead to phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a
devicetree overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a
Makefile entry, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion boar=
d.


=D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:1=
1, =D0=92=D0=BB=D0=B0=D0=B4 =D0=A1=D0=92=D0=9D <anykey196@gmail.com>:
>
> Thanks for the review - you are right. The two buttons and the IR receive=
r are on the optional 24-pin expansion board. With the board detached the L=
RADC input and the IR receiver pin are undriven and float, which can lead t=
o phantom key presses and interrupt storms.
>
> v2 drops them from the base board .dts and provides them as a devicetree =
overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a Makefile entry, fol=
lowing the existing sun8i-orangepi-zero-interface-board.dtso approach.
>
> Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion bo=
ard.
>
> =D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 15=
:59, <sashiko-bot@kernel.org>:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] arm64: dts: unconditionally enabling optional expansion board r=
isks phantom inputs and IRQ storms
>> --
>>
>> commit 51b58a06db4b29809dc98ff86ac9cae923d63f7c
>> Author: Vladnwx <vladnwx@users.noreply.github.com>
>>
>> arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion butto=
ns and IR
>>
>> This commit adds device tree nodes for the LRADC buttons and IR receiver=
 on
>> the OrangePi Zero 2W. It maps the buttons to KEY_1 and KEY_ENTER and ena=
bles
>> both the LRADC and IR controller hardware.
>>
>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> > index ff9b40352a545..1b690e3cd041e 100644
>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> [ ... ]
>> > @@ -189,3 +190,31 @@ &usbphy {
>> >       usb1_vbus-supply =3D <&reg_vcc5v>;
>> >       status =3D "okay";
>> >  };
>> > +
>> > +/*
>> > + * Buttons and IR receiver on the optional 24-pin expansion board.
>> > + * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
>> > + */
>> > +&lradc {
>> > +     vref-supply =3D <&reg_vcc3v3>;
>> > +     status =3D "okay";
>>
>> [Severity: High]
>> Could unconditionally enabling the optional LRADC on the base board caus=
e
>> phantom key presses? If the 24-pin expansion board is not attached, it s=
eems
>> the floating LRADC pin could drift into the configured 1.0V/1.6V voltage
>> thresholds and trigger unexpected button presses for users out of the bo=
x.
>> Should this be enabled via a device tree overlay instead?
>>
>> > +     wakeup-source;
>> > +
>> > +     button-1000 {
>> [ ... ]
>> > +     button-1600 {
>> > +             label =3D "KEY_ENTER";
>> > +             linux,code =3D <KEY_ENTER>;
>> > +             channel =3D <0>;
>> > +             voltage =3D <1600000>;
>> > +     };
>> > +};
>> > +
>> > +&ir {
>> > +     status =3D "okay";
>> > +};
>>
>> [Severity: High]
>> Does unconditionally enabling the IR receiver risk interrupt storms? If =
the
>> optional board is missing, a floating IR RX pin lacking an internal pull=
-up
>> might pick up electrical noise and oscillate rapidly. This could severel=
y
>> degrade system performance. Would it be safer to relegate this to an ove=
rlay
>> rather than the base device tree?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105208.1=
98-1-anykey196@gmail.com?part=3D1
