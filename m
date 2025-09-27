Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE6A18DF8D
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758999184; cv=none; b=LtEBuVO7nTQ7UywHOCShGd9Vy2zoUrucQ3hJfejsxMwNAY9/XZ5kk3kV63atPvoYanY5URAY79x0B0JXLFw4gz4db0nCaKRn8/GCSNYgo9Nl9VnSGdZh32IAIsxVyYEeBwAxgkVOWyqC/mrG8Tx7Z81dDIQIQt+sxADJXzunIbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758999184; c=relaxed/simple;
	bh=9sxOmMUOVarWa4vlnDKg5f5j/sf6HdE3dN0Q6tsBykA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=UHZ2Pu6tmRPrqmpZeQbTZxHANjiKHE5+ieFx0c0kymOrAE0K6JjkuUwcze7NC6sk3TxAyW82qvWtUYe0dI0EU+viGGV4VwPSQXEP49YELr1oJ6xYfuuiluvf4h75hu2P5OyZzclv07bEY+mnlM09bcDlXZwaNqKhVZTvvAfumWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIesDXwR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIesDXwR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ece1102998so2163469f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758999181; x=1759603981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sxOmMUOVarWa4vlnDKg5f5j/sf6HdE3dN0Q6tsBykA=;
        b=bIesDXwRqFl6C5K6QXYBlg0P7AptSiJ6dYsb+iCZFGJgHmfziU6kZpFJakCJMnTdmU
         HuUqsnNNI28w7kmim99YHtBC2bEd9aJqzdA5HLq4ODDu1/df+e4euZhrWFU/gAIm21ov
         NTxGJ11tMzcmJAFM8tqonhvScGqPvAQsp4ZZvfeA+8br/m2sPVzGDzLL4P81RKgY9SxE
         B2VGOzyXsgB9V0x0HlitFjxZzP3l8zlKWc1Ca6naU3siCdw+BJeFwAbnViUZUPrDfvD4
         zOnCQeGXfp1VBZuOytZ7mqv/pZTgGkXrCVHrNsC6QcHNipwNOlBdsi/Rah8Zcjm3fK6g
         GYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758999181; x=1759603981;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9sxOmMUOVarWa4vlnDKg5f5j/sf6HdE3dN0Q6tsBykA=;
        b=s15fungxtnV65UWQv9lriGMOfA8sgOF3QpIxCJqPzj/GsUREKe1SM+w5cebJxVcaQ0
         GlFvqiWQa8udA4tJdEQK4DI4o+H/Pels1HdGa5R2A/sNaGBqSIX0kGERvxEC8tPxjYWJ
         khOb32eKxTKrXu6POKbkMejC6k8mG1QDP9UeK2KY0V5EuGgH6GhHtj03X+YG+zJ5t2QS
         MViMctl0YO7u0gknEiwCsOAgynfIqk+fH22LUROb5xhu3Es/Tgjm6spPv1bpHFvVZVUD
         OaNOeaMk722lI3LR7ANX/yz+JDJ31pxv7h+s/nHVWMJ8Cuz3LIkiJrNiHPvZCjyjBNKB
         tnew==
X-Forwarded-Encrypted: i=1; AJvYcCXaNtomXFmWznq+09Jad7w4MgGUrFXoxPZoyqgvXAdWwTsseboWpEsjWkDX1sAlNo5VaIKv9CHj++GwKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHSZhOe5kQvnzHJJRAS1xHwbjiwYe2kZE17BPjTVHehZPEFHvT
	Rz0EdKtjdH6r3DaF9dAVpwGuof+Wx9vFeLecAAKTifQYgpFfigTkCqGfnOK5zxsr
X-Gm-Gg: ASbGncsfAJ+8X5mdN9eBh0NDajUsTNPL7ktHTugJ5eFnYy5WoM8Vt9dzpMU4D45AMCr
	NwU0qkYnz9PqfyIQ0a49dAwrs3WYJYtPf70+h35s3IHYTYFTmNqtlis2WjVzZMvk8fnOMCtHIUl
	RIeh18CbEQLiSFbs2N+bEljgFWpNtqAoK8XF2OhkYEZuzedkK7RH+3ZpSBXYMO6yvnY5bLF2wNp
	8wMoV4Px5r+jIuF0G26EykHZrYorPIN4sUEbevo0GNCkPqOw6XZXfjVW2OSVDoZsDYBnqXgNfpl
	YNsJ6ZD4NrTUB3brVHjDa82a3TShygjW94yx4ya7mMT/xE0BRrXgQmfMuFdD7meQxQ1Xl7PkZMQ
	LZceAxJa26GOfYQDbQ3sra8NUj6jSCtrVDlBF
X-Google-Smtp-Source: AGHT+IFlycwFgOAmFX2zzLjEF6kyQxs3S0aGt3gldyvxaQ+9VrfaE6/PVsGKEc/TuFAsf1R93r+y5A==
X-Received: by 2002:a05:6000:2586:b0:3ff:44fd:db10 with SMTP id ffacd0b85a97d-40e42502ee4mr7858962f8f.4.1758999180986;
        Sat, 27 Sep 2025 11:53:00 -0700 (PDT)
Received: from [127.0.0.1] ([94.44.96.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc86c5958sm11690210f8f.57.2025.09.27.11.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 11:53:00 -0700 (PDT)
Date: Sat, 27 Sep 2025 20:52:57 +0200 (GMT+02:00)
From: =?UTF-8?Q?Baltaz=C3=A1r_Radics?= <baltazar.radics@gmail.com>
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?Q?Cs=C3=B3k=C3=A1s_Bence?= <csokas.bence@prolan.hu>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Message-ID: <4c8276a4-a405-4780-abd0-bb4a33eb6a14@gmail.com>
In-Reply-To: <w5dviim2u2kc4enifywag2skacq72qz5enpjk6orica7kyith6@2ukao7sjagj5>
References: <ffef657cce57b7bce005b99f9b14dc81c9ae4535.camel@gmail.com> <391d0e76-93bb-48a4-a6d5-2938766710a0@sirena.org.uk> <w5dviim2u2kc4enifywag2skacq72qz5enpjk6orica7kyith6@2ukao7sjagj5>
Subject: Re: ASoC: sun4i-codec: Missing snd_soc_component_driver names
 causing NULL pointer dereference
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <4c8276a4-a405-4780-abd0-bb4a33eb6a14@gmail.com>

Hi!

Sep 27, 2025 20:21:00 Ond=C5=99ej Jirman <megi@xff.cz>:

> Hi Baltaz=C3=A1r,
>
> On Fri, Sep 26, 2025 at 04:31:25PM +0100, Mark Brown wrote:
>> On Fri, Sep 26, 2025 at 05:10:30PM +0200, Baltaz=C3=A1r Radics wrote:
>>> I ran into an issue where the kernel would panic depending on sun4i-
>>> codec vs sun8i-codec-analog driver load order. (If both are compiled-
>>> in, the default order does reproduce the crash.)If sun4i-codec was
>>> loaded before its analog component, snd_soc_register_card would return
>>> -EPROBE_DEFER. During cleanup snd_soc_unregister_component_by_driver
>>> tries to find components by driver name leading to the following oops:
>
> Your kernel version (6.16.5) does not contain fix for this:
>
> =C2=A0 https://lore.kernel.org/linux-sound/87ect8ysv8.wl-kuninori.morimot=
o.gx@renesas.com/

Shoot, I didn't notice this one. Thanks for the info and sorry for the nois=
e!

> Kind regards,
> =C2=A0=C2=A0=C2=A0 o.
>
>> Copying in some of the people who work on sunxi.=C2=A0 It seems clear th=
at we
>> should handle missing names more gracefully here.
>>
>>>
>>> [=C2=A0=C2=A0=C2=A0 0.841199] 8<--- cut here ---
>>> [=C2=A0=C2=A0=C2=A0 0.844315] Unable to handle kernel NULL pointer dere=
ference at virtual address 00000000 when read
>>> [=C2=A0=C2=A0=C2=A0 0.853268] [00000000] *pgd=3D00000000
>>> [=C2=A0=C2=A0=C2=A0 0.856885] Internal error: Oops: 5 [#1] SMP ARM
>>> [=C2=A0=C2=A0=C2=A0 0.861507] Modules linked in:
>>> [=C2=A0=C2=A0=C2=A0 0.864569] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not =
tainted 6.16.5 #1 NONE
>>> [=C2=A0=C2=A0=C2=A0 0.871617] Hardware name: Allwinner sun8i Family
>>> [=C2=A0=C2=A0=C2=A0 0.876316] PC is at strcmp+0x0/0x34
>>> [=C2=A0=C2=A0=C2=A0 0.879911] LR is at snd_soc_lookup_component_nolocke=
d+0x64/0xa4
>>> [=C2=A0=C2=A0=C2=A0 0.885923] pc : [<c08e8824>]=C2=A0=C2=A0=C2=A0 lr : =
[<c075679c>]=C2=A0=C2=A0=C2=A0 psr: 00000013
>>> [=C2=A0=C2=A0=C2=A0 0.892184] sp : e0821de0=C2=A0 ip : 00000000=C2=A0 f=
p : c0c615e8
>>> [=C2=A0=C2=A0=C2=A0 0.897404] r10: 00000006=C2=A0 r9 : c0c49854=C2=A0 r=
8 : 0000001b
>>> [=C2=A0=C2=A0=C2=A0 0.902624] r7 : c0b04de8=C2=A0 r6 : c125b010=C2=A0 r=
5 : c0dde7e8=C2=A0 r4 : c1a95a40
>>> [=C2=A0=C2=A0=C2=A0 0.909146] r3 : c09b1d50=C2=A0 r2 : 0000006e=C2=A0 r=
1 : c0b04de8=C2=A0 r0 : 00000000
>>> [=C2=A0=C2=A0=C2=A0 0.915669] Flags: nzcv=C2=A0 IRQs on=C2=A0 FIQs on=
=C2=A0 Mode SVC_32=C2=A0 ISA ARM=C2=A0 Segment none
>>> [=C2=A0=C2=A0=C2=A0 0.922802] Control: 10c5387d=C2=A0 Table: 4000406a=
=C2=A0 DAC: 00000051
>>> [=C2=A0=C2=A0=C2=A0 0.928541] Register r0 information: NULL pointer
>>> [=C2=A0=C2=A0=C2=A0 0.933250] Register r1 information: non-slab/vmalloc=
 memory
>>> [=C2=A0=C2=A0=C2=A0 0.938908] Register r2 information: non-paged memory
>>> [=C2=A0=C2=A0=C2=A0 0.943958] Register r3 information: non-slab/vmalloc=
 memory
>>> [=C2=A0=C2=A0=C2=A0 0.949615] Register r4 information: slab kmalloc-256=
 start c1a95a00 pointer offset 64 size 256
>>> [=C2=A0=C2=A0=C2=A0 0.958327] Register r5 information: non-slab/vmalloc=
 memory
>>> [=C2=A0=C2=A0=C2=A0 0.963984] Register r6 information: slab kmalloc-1k =
start c125b000 pointer offset 16 size 1024
>>> [=C2=A0=C2=A0=C2=A0 0.972693] Register r7 information: non-slab/vmalloc=
 memory
>>> [=C2=A0=C2=A0=C2=A0 0.978350] Register r8 information: non-paged memory
>>> [=C2=A0=C2=A0=C2=A0 0.983400] Register r9 information: non-slab/vmalloc=
 memory
>>> [=C2=A0=C2=A0=C2=A0 0.989057] Register r10 information: non-paged memor=
y
>>> [=C2=A0=C2=A0=C2=A0 0.994193] Register r11 information: non-slab/vmallo=
c memory
>>> [=C2=A0=C2=A0=C2=A0 0.999937] Register r12 information: NULL pointer
>>> [=C2=A0=C2=A0=C2=A0 1.004726] Process swapper/0 (pid: 1, stack limit =
=3D 0x(ptrval))
>>> [=C2=A0=C2=A0=C2=A0 1.010730] Stack: (0xe0821de0 to 0xe0822000)
>>> [=C2=A0=C2=A0=C2=A0 1.015091] 1de0: c0b04de8 c125b010 c125b010 e0821e18=
 0000001b c0758f20 c1a95c0c c125b010
>>> [=C2=A0=C2=A0=C2=A0 1.023264] 1e00: c125b010 c076c86c c1a9bc00 c1a9bc80=
 c125b010 c058804c c112b780 c1a95d00
>>> [=C2=A0=C2=A0=C2=A0 1.031436] 1e20: 00000007 75b58edd c125b010 00000205=
 c0ddec6c 00000000 c1a9b3b8 c05821b0
>>> [=C2=A0=C2=A0=C2=A0 1.039608] 1e40: c125b010 c0582960 c125b010 c0ddec6c=
 c125b010 00000000 c1a9b3b8 c0582a90
>>> [=C2=A0=C2=A0=C2=A0 1.047781] 1e60: 60000013 c0c49854 c0e25818 c0ddec6c=
 c125b010 00000000 c1a9b3b8 c0582c74
>>> [=C2=A0=C2=A0=C2=A0 1.055953] 1e80: c125b010 c0ddec6c c125b054 c1016000=
 c1a9b3b8 c0582eec 00000000 c0ddec6c
>>> [=C2=A0=C2=A0=C2=A0 1.064126] 1ea0: c0582e5c c0580950 c1016000 c1016058=
 c10f7234 75b58edd c1016000 c0ddec6c
>>> [=C2=A0=C2=A0=C2=A0 1.072298] 1ec0: c1a9b380 00000000 c1016000 c0581b74=
 c0b0534c 00000000 c0ddec6c c1050000
>>> [=C2=A0=C2=A0=C2=A0 1.080471] 1ee0: 00000000 c0deb000 c0deb000 c0583bf8=
 c0c2ddd8 c1050000 00000000 c010e26c
>>> [=C2=A0=C2=A0=C2=A0 1.088643] 1f00: 000004bf 00000000 00000000 00000000=
 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.096814] 1f20: 00000000 00000000 00000000 00000000=
 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.104986] 1f40: 00000000 00000000 00000000 75b58edd=
 c11a6200 000000f3 c11a6200 c0c49834
>>> [=C2=A0=C2=A0=C2=A0 1.113158] 1f60: c0deb000 c0b14140 c0c49854 c0c01264=
 00000006 00000006 00000000 c0c004d0
>>> [=C2=A0=C2=A0=C2=A0 1.121331] 1f80: c08f37a8 c0d04e80 c08f37a8 00000000=
 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.129503] 1fa0: 00000000 c08f37c4 00000000 c010014c=
 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.137674] 1fc0: 00000000 00000000 00000000 00000000=
 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.145846] 1fe0: 00000000 00000000 00000000 00000000=
 00000013 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.154014] Call trace:
>>> [=C2=A0=C2=A0=C2=A0 1.154030]=C2=A0 strcmp from snd_soc_lookup_componen=
t_nolocked+0x64/0xa4
>>> [=C2=A0=C2=A0=C2=A0 1.162926]=C2=A0 snd_soc_lookup_component_nolocked f=
rom snd_soc_unregister_component_by_driver+0x2c/0x44
>>> [=C2=A0=C2=A0=C2=A0 1.172065]=C2=A0 snd_soc_unregister_component_by_dri=
ver from snd_dmaengine_pcm_unregister+0x28/0x64
>>> [=C2=A0=C2=A0=C2=A0 1.180773]=C2=A0 snd_dmaengine_pcm_unregister from d=
evres_release_all+0x98/0xfc
>>> [=C2=A0=C2=A0=C2=A0 1.187749]=C2=A0 devres_release_all from device_unbi=
nd_cleanup+0xc/0x60
>>> [=C2=A0=C2=A0=C2=A0 1.194028]=C2=A0 device_unbind_cleanup from really_p=
robe+0x220/0x2c8
>>> [=C2=A0=C2=A0=C2=A0 1.200046]=C2=A0 really_probe from __driver_probe_de=
vice+0x88/0x1a0
>>> [=C2=A0=C2=A0=C2=A0 1.205977]=C2=A0 __driver_probe_device from driver_p=
robe_device+0x30/0x110
>>> [=C2=A0=C2=A0=C2=A0 1.212515]=C2=A0 driver_probe_device from __driver_a=
ttach+0x90/0x178
>>> [=C2=A0=C2=A0=C2=A0 1.218533]=C2=A0 __driver_attach from bus_for_each_d=
ev+0x7c/0xcc
>>> [=C2=A0=C2=A0=C2=A0 1.224203]=C2=A0 bus_for_each_dev from bus_add_drive=
r+0xcc/0x1ec
>>> [=C2=A0=C2=A0=C2=A0 1.229871]=C2=A0 bus_add_driver from driver_register=
+0x80/0x11c
>>> [=C2=A0=C2=A0=C2=A0 1.235457]=C2=A0 driver_register from do_one_initcal=
l+0x58/0x23c
>>> [=C2=A0=C2=A0=C2=A0 1.241134]=C2=A0 do_one_initcall from kernel_init_fr=
eeable+0x1dc/0x238
>>> [=C2=A0=C2=A0=C2=A0 1.247324]=C2=A0 kernel_init_freeable from kernel_in=
it+0x1c/0x12c
>>> [=C2=A0=C2=A0=C2=A0 1.253079]=C2=A0 kernel_init from ret_from_fork+0x14=
/0x28
>>> [=C2=A0=C2=A0=C2=A0 1.258137] Exception stack(0xe0821fb0 to 0xe0821ff8)
>>> [=C2=A0=C2=A0=C2=A0 1.263187] 1fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.271359] 1fc0: 00000000 00000000 00000000 00000000=
 00000000 00000000 00000000 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.279530] 1fe0: 00000000 00000000 00000000 00000000=
 00000013 00000000
>>> [=C2=A0=C2=A0=C2=A0 1.286145] Code: e5e32001 e3520000 1afffffb e12fff1e=
 (e4d03001)
>>> [=C2=A0=C2=A0=C2=A0 1.292290] ---[ end trace 0000000000000000 ]---
>>>
>>> The specific hardware in my case is a FriendlyARM NanoPi Duo2. Note
>>> that the current device tree has the relevant node disabled, so I'm
>>> running with the following patch applied:
>>>
>>> ---
>>> arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts | 8 ++++++++
>>> 1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts b/arc=
h/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
>>> index 2b0566d4b386..6301b1a78301 100644
>>> --- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
>>> +++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
>>> @@ -137,6 +137,14 @@ &reg_usb0_vbus {
>>> =C2=A0=C2=A0=C2=A0 status =3D "okay";
>>> };
>>>
>>> +&codec {
>>> +=C2=A0=C2=A0 status =3D "okay";
>>> +=C2=A0=C2=A0 allwinner,audio-routing =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Line Out", "LI=
NEOUT",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MIC1", "Mic",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Mic", "MBIAS";
>>> +};
>>> +
>>> &uart0 {
>>> =C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
>>> =C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&uart0_pa_pins>;
>>> --
>>>
>>>
>>> I'm not sure if it's the correct solution, but setting the names of
>>> these snd_soc_component_driver instances does seem to fix my issue:
>>>
>>> ---
>>> sound/soc/sunxi/sun4i-codec.c | 6 ++++++
>>> 1 file changed, 6 insertions(+)
>>>
>>> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-code=
c.c
>>> index 93733ff2e32a..f00537f7f97d 100644
>>> --- a/sound/soc/sunxi/sun4i-codec.c
>>> +++ b/sound/soc/sunxi/sun4i-codec.c
>>> @@ -959,6 +959,7 @@ static const struct snd_soc_dapm_route sun4i_codec_=
codec_dapm_routes[] =3D {
>>> };
>>>
>>> static const struct snd_soc_component_driver sun4i_codec_codec =3D {
>>> +=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "sun4i-codec-codec",
>>> =C2=A0=C2=A0=C2=A0 .controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D su=
n4i_codec_controls,
>>> =C2=A0=C2=A0=C2=A0 .num_controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D ARRAY_SIZE(sun4i_codec_controls),
>>> =C2=A0=C2=A0=C2=A0 .dapm_widgets=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D sun4i_codec_codec_dapm_widgets,
>>> @@ -971,6 +972,7 @@ static const struct snd_soc_component_driver sun4i_=
codec_codec =3D {
>>> };
>>>
>>> static const struct snd_soc_component_driver sun7i_codec_codec =3D {
>>> +=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "sun7i-codec-codec",
>>> =C2=A0=C2=A0=C2=A0 .controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D su=
n7i_codec_controls,
>>> =C2=A0=C2=A0=C2=A0 .num_controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D ARRAY_SIZE(sun7i_codec_controls),
>>> =C2=A0=C2=A0=C2=A0 .dapm_widgets=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D sun4i_codec_codec_dapm_widgets,
>>> @@ -1278,6 +1280,7 @@ static const struct snd_soc_dapm_route sun6i_code=
c_codec_dapm_routes[] =3D {
>>> };
>>>
>>> static const struct snd_soc_component_driver sun6i_codec_codec =3D {
>>> +=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "sun6i-codec-codec",
>>> =C2=A0=C2=A0=C2=A0 .controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D su=
n6i_codec_codec_widgets,
>>> =C2=A0=C2=A0=C2=A0 .num_controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D ARRAY_SIZE(sun6i_codec_codec_widgets),
>>> =C2=A0=C2=A0=C2=A0 .dapm_widgets=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D sun6i_codec_codec_dapm_widgets,
>>> @@ -1307,6 +1310,7 @@ static const struct snd_soc_dapm_widget sun8i_a23=
_codec_codec_widgets[] =3D {
>>> };
>>>
>>> static const struct snd_soc_component_driver sun8i_a23_codec_codec =3D =
{
>>> +=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "sun8i-a23-codec-codec",
>>> =C2=A0=C2=A0=C2=A0 .controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D su=
n8i_a23_codec_codec_controls,
>>> =C2=A0=C2=A0=C2=A0 .num_controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D ARRAY_SIZE(sun8i_a23_codec_codec_controls),
>>> =C2=A0=C2=A0=C2=A0 .dapm_widgets=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D sun8i_a23_codec_codec_widgets,
>>> @@ -1527,6 +1531,7 @@ static const struct snd_soc_dapm_route suniv_code=
c_codec_dapm_routes[] =3D {
>>> };
>>>
>>> static const struct snd_soc_component_driver suniv_codec_codec =3D {
>>> +=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "suniv-codec-codec",
>>> =C2=A0=C2=A0=C2=A0 .controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D su=
niv_codec_codec_widgets,
>>> =C2=A0=C2=A0=C2=A0 .num_controls=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D ARRAY_SIZE(suniv_codec_codec_widgets),
>>> =C2=A0=C2=A0=C2=A0 .dapm_widgets=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D suniv_codec_codec_dapm_widgets,
>>> @@ -1952,6 +1957,7 @@ static const struct snd_soc_dapm_widget sun50i_h6=
16_codec_codec_widgets[] =3D {
>>> };
>>>
>>> static const struct snd_soc_component_driver sun50i_h616_codec_codec =
=3D {
>>> +=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "sun50i-h61=
6-codec-codec",
>>> =C2=A0=C2=A0=C2=A0 .controls=C2=A0=C2=A0 =3D sun50i_h616_codec_codec_co=
ntrols,
>>> =C2=A0=C2=A0=C2=A0 .num_controls=C2=A0=C2=A0 =3D ARRAY_SIZE(sun50i_h616=
_codec_codec_controls),
>>> =C2=A0=C2=A0=C2=A0 .dapm_widgets=C2=A0=C2=A0 =3D sun50i_h616_codec_code=
c_widgets,
>>> --
>>> 2.51.0

