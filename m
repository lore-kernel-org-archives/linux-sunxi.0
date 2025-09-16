Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038592C1591
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Sep 2025 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758029757; cv=none; b=iCczKJOKUHreQcVwFIjZMlngh39jewff8/GRaVItBtGCEHM8Ft10aC6AOSYfowv2mSUaJCvsqof0eldPTM5ug8n4b/s3J9g7AC35mbTDsPAKLynO02DB4CAT33EVST33x0fL/PgvdpVZvDhTAPMVF7xySYaUHHUE6IOfb8t23v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758029757; c=relaxed/simple;
	bh=B26IW0i73lVhKRQw115gKq48NZOqUyslDZFWUN0EmxI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kbXGhe4xT2Csnte4ZRi/nWI3VfhQxd0tYTJuqZF8iw+615H2e2YBhkZI6NNWvYrB8ilxT5DduMjwfMUbu+Iql5WoyrfeT0iH+Ost48eWj7+Q4rgqa2MluFKawJMHKBf95wvat5S1Yb8ljyntKDgSbftyoeBY50dhddIeuR2gtEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMRHVnF6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMRHVnF6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7a16441so824116766b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Sep 2025 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758029754; x=1758634554; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J04UapWI2FdvEY63Zx7m+nJIgGiy620hLj4nLyFtLI=;
        b=bMRHVnF62jDEU+/EIW8BU6kodAHdiPH2xh4eQKCKDKOrm9A0MeflLhYEeXzlAN7kaz
         ELwz/MuzYk+V6jH755Gt+6hDXf4PbWMnEgzvLueVRIyEqBSS7GbRDgQFwjuEp3cQUiZD
         bIBnuFwHOkP66eLXavH0ikFwdQm1mQoJhuLJBCc6GD30lGOLTp/G2pFR4H4CsjUch6JG
         COaGOfosPhaAEd+0dTNJYwBLSGWFMut42vdw1+WkbEOV/njpd6yCog3rCNXKEz1A/TAG
         lwmxFXlO7cFV4QMwKhfgYQK1bEFabXOf+levqrPyiSunYna7l84GFVYfeQi1gvEoyXGC
         TUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029754; x=1758634554;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J04UapWI2FdvEY63Zx7m+nJIgGiy620hLj4nLyFtLI=;
        b=lf+GwJbD3LH/5zfDyEHdhG99jdI+oTKN+t+j5u5V93T2gkZz/RhlgiXD98yyx+i4tN
         UzXLkatMLtmtj++A0yxPEM21MkdlgBnOk8t5RakUlZieg4YHBqmkYKulzkEQZQwWPmpy
         H6Uqoi//wsDY5iDqesnF3wDnWbgYP0hRf6a7gCBPgsJal2u0WsA6M4NJbnfZFlmShGGL
         uJS/EaF25WkSWvYjkmqzRQetHPtBoFU01NgtyjPgos0hnYwJbAnqB1CTQl71lfpkMs2s
         k2KVMLffilq2hLycI2Up8s6IEJZw6zdYzO575a8mbHEGWLzuK7d8hBzVkH1Hfhk95vCO
         kyNg==
X-Forwarded-Encrypted: i=1; AJvYcCW0SUCFMixvEYPMi0N7/jq45II3vEhh/UiiqsJCwYetxz5Xa9id4qW+Mfz4Wjr8x0aOsAJbRXwpWtdfNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMOrRsYS7VIl0EG26/3mfdbJ7EX402RovOB0dOpZw1bHk0M97L
	xdJ2vFXQeFeqHHTKTJrxJmyDtvXYR/zUeQEd2wobvcSP95VT5ZTKmT0VhxOVuQ==
X-Gm-Gg: ASbGncvSdjvQHaZjq+CJy6QhNV4V19EWSiDJ5pZ/XDuCL/eIG+D0OB5/wHkG0DqEazY
	R+GxKxRkWtJ7zRqfJWIBrBwBg/G4jp4Dbems1WCWJKS+y/vyoYhpakd+mpTpQLAkhADBa0G8Rl6
	yk6tNbQI86yoNwg4JLr6HioLcM2Uernw7Nyr4ihvIBR+Jfd5REh7WLLRQ+Ob4Fe04C47ypqlOtJ
	axrazmpYqgAJYGV8lwnCjCZdgL6oye8VzLjUB51snBc3cUgcXzU872fWN8/STmcLi5b6fgj2LVJ
	KQu+QQNQ1K0ZCKPQNbmI6I6BcmmQdCI0S9WZvFbjbiMQVMWsFk18gSVhyXdfO3pLc5y6/oy6mtN
	hC2JF5fCcwB1OofZJ1OYgdvJTIAeNFbqo3BbRQBIILOYMPYV19SWms5MY9ms/6xam9g==
X-Google-Smtp-Source: AGHT+IE2xcYp3KB8o6LZkSmtT/XRvgW8z+8vm9peFmryVjFu/LV+VCJJwaZ2rw2yq+66JUP/hPTLZA==
X-Received: by 2002:a17:907:3f99:b0:b10:1af1:dc2a with SMTP id a640c23a62f3a-b101af1dce3mr774107366b.38.1758029753763;
        Tue, 16 Sep 2025 06:35:53 -0700 (PDT)
Received: from smtpclient.apple (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd601sm1151309266b.60.2025.09.16.06.35.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:35:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v1 1/1] sunxi: extend R528/T113-s3/D1(s) DRAM
 initialisation
From: =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
In-Reply-To: <20250915163637.38d05aab@donnerap>
Date: Tue, 16 Sep 2025 15:35:42 +0200
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
 Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <974306F8-B297-4DCD-A827-129651271935@gmail.com>
References: <20250914144411.157826-1-lukas.schmid@netcube.li>
 <20250915163637.38d05aab@donnerap>
To: Andre Przywara <andre.przywara@arm.com>
X-Mailer: Apple Mail (2.3826.700.81)



> On 2025. Sep 15., at 17:36, Andre Przywara <andre.przywara@arm.com> =
wrote:
>=20
> On Sun, 14 Sep 2025 16:44:11 +0200
> Lukas Schmid <lukas.schmid@netcube.li> wrote:
>=20
> Hi Lukas,
>=20
> thanks for the patch!
>=20
> CC:ing the sunxi list and Andr=C3=A1s, who I think has some T113-s4 =
device as
> well.
>=20

Thanks, but unfortunately I don=E2=80=99t have a board with T113-S4.=20
So awboot was not tested with this SoC, at least by me.

> It would be good to see some Tested-by: tags, but otherwise the patch
> looks good, I'd say.
>=20
> Also I hear that awboot uses 0x6800 as the chip ID for the -s4, can
> someone shed some light on this?
>=20
> Cheers,
> Andre
>=20
>> Extend the DRAM initialisation code to add support for the T113-S4 =
aka
>> T113M4020DC0 by checking the SoC's CHIPID.
>>=20
>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
>> ---
>> drivers/ram/sunxi/dram_sun20i_d1.c | 13 ++++++++++++-
>> drivers/ram/sunxi/dram_sun20i_d1.h |  7 +++++++
>> 2 files changed, 19 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/ram/sunxi/dram_sun20i_d1.c =
b/drivers/ram/sunxi/dram_sun20i_d1.c
>> index a1794032f3b..01d19d5feaa 100644
>> --- a/drivers/ram/sunxi/dram_sun20i_d1.c
>> +++ b/drivers/ram/sunxi/dram_sun20i_d1.c
>> @@ -54,6 +54,11 @@ static void sid_read_ldoB_cal(const dram_para_t =
*para)
>> clrsetbits_le32(0x3000150, 0xff00, reg << 8);
>> }
>>=20
>> +static u32 sid_read_soc_chipid(void)
>> +{
>> + return readl(SUNXI_SID_BASE + 0x00) & 0xffff;
>> +}
>> +
>> static void dram_voltage_set(const dram_para_t *para)
>> {
>> int vol;
>> @@ -663,6 +668,7 @@ static void mctl_phy_ac_remapping(const =
dram_para_t *para,
>>=20
>> fuse =3D (readl(SUNXI_SID_BASE + 0x28) & 0xf00) >> 8;
>> debug("DDR efuse: 0x%x\n", fuse);
>> + debug("SoC Chip ID: 0x%08x\n", sid_read_soc_chipid());
>>=20
>> if (para->dram_type =3D=3D SUNXI_DRAM_TYPE_DDR2) {
>> if (fuse =3D=3D 15)
>> @@ -675,7 +681,12 @@ static void mctl_phy_ac_remapping(const =
dram_para_t *para,
>> switch (fuse) {
>> case 8: cfg =3D ac_remapping_tables[2]; break;
>> case 9: cfg =3D ac_remapping_tables[3]; break;
>> - case 10: cfg =3D ac_remapping_tables[5]; break;
>> + case 10:
>> + if (sid_read_soc_chipid() =3D=3D SUNXI_CHIPID_T113M4020DC0)
>> + cfg =3D ac_remapping_tables[0];
>> + else
>> + cfg =3D ac_remapping_tables[5];
>> + break;
>> case 11: cfg =3D ac_remapping_tables[4]; break;
>> default:
>> case 12: cfg =3D ac_remapping_tables[1]; break;
>> diff --git a/drivers/ram/sunxi/dram_sun20i_d1.h =
b/drivers/ram/sunxi/dram_sun20i_d1.h
>> index 91383f6cf10..7bd8f67a77a 100644
>> --- a/drivers/ram/sunxi/dram_sun20i_d1.h
>> +++ b/drivers/ram/sunxi/dram_sun20i_d1.h
>> @@ -19,6 +19,13 @@ enum sunxi_dram_type {
>> SUNXI_DRAM_TYPE_LPDDR3 =3D 7,
>> };
>>=20
>> +enum sunxi_soc_chipid {
>> + SUNXI_CHIPID_F133A =3D 0x5C00,
>> + SUNXI_CHIPID_D1S =3D 0x5E00,
>> + SUNXI_CHIPID_T113S3 =3D 0x6000,
>> + SUNXI_CHIPID_T113M4020DC0 =3D 0x7200,
>> +};
>> +
>> /*
>>  * This structure contains a mixture of fixed configuration settings,
>>  * variables that are used at runtime to communicate settings between
>=20

