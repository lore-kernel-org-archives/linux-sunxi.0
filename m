Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51332D0DE
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413195; cv=none; b=oQaVQpxoC2U4eisuMVBJSkaz2Of9mJD+7P8GdTPicbNXVTYrxN551IG1JDTEvqm+o0gFlRCrrAKBuMW6UOgyeCst1vVunEfOMitasdNPD+SyUYebGWze6vzfqLry61slozH1CL0zEFD0NK74KeLIESCZRenQyab0WFU+tAehu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413195; c=relaxed/simple;
	bh=qCiNYpj/fD6QvcI2JnZSyaYV1FRFHfQHPffRlHULXxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyVwzTgSYRiYBqVJlKqtI54p3zT7Yy4ee45bm7TMrDun42oQ294XLt2R8I/Tc+TU9xh23HO+GEKW+NyClNtnN2VcprM4DajEY01qwpmftZTOIWPceusOgo0M9KteIsQSc2dsQsLXGqph3ehvD8udHVoxjO0nbbcjNQh12Tu287o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=benettiengineering.com; spf=pass smtp.mailfrom=benettiengineering.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=nREDKuJn; arc=none smtp.client-ip=62.149.155.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benettiengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="nREDKuJn"
Received: from [192.168.50.220] ([84.33.84.190])
	by Aruba SMTP with ESMTPSA
	id g50KvJnVjclBZg50Lv2sF0; Wed, 14 Jan 2026 18:50:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1768413002; bh=qCiNYpj/fD6QvcI2JnZSyaYV1FRFHfQHPffRlHULXxE=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=nREDKuJnqIoQQLsYftRsNn5nffXuySjn+oCgGh/Aa5t0Q0a7eWV0SN6QAmFU4XMyy
	 3nZE71xJ1f4M+0d/Q4X0Fkcgb7PtJFXtGxIxLbAjQ9Zc4sW6s35pZjuItnX3z6uvae
	 /vK3laL1CG4P13W2ppwDOdFrhgITxtN6Eit8b0RejdXXE8PlCUZh5Y1WhMaigNymWi
	 kXVxxoY+bQLsM1HRyw0ornvuC4+deQcX0VHxjb+y7nE0dTp4dxdsEpHzETWSbI6IIo
	 anxFGkkrwox9yVxPWntXOB2WDnD32f3L0wGa1rc91w/t0GCNZM1bh1sVHUeqfW4COl
	 7N47H0FQPGCqA==
Message-ID: <40e45abf-7640-49a6-814b-9924510395c1@benettiengineering.com>
Date: Wed, 14 Jan 2026 18:50:00 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
 <20260114140653.05365221@orionap.fritz.box>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260114140653.05365221@orionap.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOlfoxKjK0AY8atOCrqaGKkGzr99mKANRPOLxddXbdjSNeayXmE2yayY5do5xlWoXgqwZ0wwuOZyDy/9xoYnWY/z0Eyv44tXtd1AXJK4SwhypD0kUp3z
 JMLMPL3ZhNEjNLrr9cMDRDd8OFCabBPVktqMmNzuc1UGoRXwBzZufKP14t0S/uZ3RADKlty6Z4n55EOKI/oUicZC7KCRVq8J+Anb6/bPhcvClSeqjevTKybG
 YTJM0uTLXxJc7nslKra1WzQk3HdtR35Ar6PsjeuwigKSxenZdW5+qFdhIV2DqHea45pA1t4wEqIztGzgRHvB0NUlyuAj2cWpDCplJGidGqEJ6OaB9IOQwTAN
 sGdX5XHxCThh1sGYd9pjXpKA3aHPAF0zTFWl7aalLNCpNCgHEGTXgGdGyPtrCU+6D331vOUnCQNqESN1W0VBkNNIkd5Gsc07dto9tkyG4mybvrwiG/u8nGDZ
 6i8zKyXRNbW0NXAI+F8cHZzNyM7RevCE7m4TD/7nmTcvU1r/hIxuQy+33HSHB4QunkDl7/lWLCEjXNvRSbtBh4jil2ZsS8yLf9+R8g==

On 1/14/26 15:06, Andre Przywara wrote:
> On Wed, 14 Jan 2026 11:50:04 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
> Hi Giulio,
> 
>> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
>> enumeration during boot. When both an SDIO WiFi module (MMC1) and
>> an SD card (MMC0) are present, the kernel may swap their indices.
>>
>> Explicitly define mmc* aliases to ensure consistent device naming
>> and prevent mapping conflicts.
> 
> So this comes up every now and then, but for sunxi it was decided to not
> support this. The enumeration of devices in the kernel is never guaranteed
> to follow some order, and this is widely accepted for SCSI (/dev/sda) and
> NVMe. Distros are coping with this forever since, using more sustainable
> designations like UUIDs or labels.

I see,

> If you don't want to change the way you communicate the root device to the
> kernel, you can actually use U-Boot's DTs, which adds the indicies for its
> own purposes, and can pass this on to the kernel. Just don't load a DT
> from storage (which you shouldn't be doing anyways), and just use
> $fdtcontroladdr as the DT address when booting the kernel.

Thanks for pointing, let's see if Buildroot Maintainers accept this
patch as is, otherwise I'll probably go with UUID.

Thank you for taking care and explaining.

Best regards
Giulio

> Cheers,
> Andre
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> index 5f44f09c5545..a958400bcd7c 100644
>> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> @@ -55,6 +55,10 @@ / {
>>   	#size-cells = <1>;
>>   
>>   	aliases {
>> +		mmc0 = &mmc0;
>> +		mmc1 = &mmc1;
>> +		mmc2 = &mmc2;
>> +		mmc3 = &mmc3;
>>   		ethernet0 = &gmac;
>>   	};
>>   
> 


