Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82314658B
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Jun 2024 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301030; cv=none; b=R+IBYH3EADP40AafIRzd5xt4yj8AAwS2YGKsIHh86z6bkp2IR7kZAt4LvGo7jthStigQZd9DxuI4vRnoy61b8QRhq9hhHLSk1vs21TGQorCl9UXv9ni5QJbSrm9wQZLI3RbMd/nvfUNTVhZVDJT6l+sDe6obXQ73kGdnwqWakbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301030; c=relaxed/simple;
	bh=blHGl7YrLZrp0runine851Pzqlb9ZjFxG0Vn9AY/Hpg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o2kVu+1BhKUsKfeCHTPblDbN4O+SuzpV3sV+AqVgwDQeMAGSlKKaYu8qGW7V+kBpRDkMHxAi1sxwFQsDN2GTd8Qvml4zNtOSy5+oo5+DyCqfUJs94SNUPggFKCvLgkUg+uqXOiSPhrFZVQehTcB+EGNf9PUwMxVA7QBT/POPY/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Sjras/TT; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Sjras/TT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1719301008; bh=blHGl7YrLZrp0runine851Pzqlb9ZjFxG0Vn9AY/Hpg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Sjras/TTidKALzyf1fynFV3OJJ23G+E8GMacj/N8D8RVTs43DXI3yjjeHuhdgsCt2
	 S3yzuyuZ/99St38mJ5lF/aC3nPBJW3RDZ/FnR1mM6HvldJfC06dxiGPblQpO0FxhYw
	 /RAmQFQnlYNUl4MjhSw7CFLEf1gRyJ2hIMrjHPyI=
Received: from [172.19.0.1] ([1.202.45.181])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 7A1AD09D; Tue, 25 Jun 2024 15:30:33 +0800
X-QQ-mid: xmsmtpt1719300633tccg7adpq
Message-ID: <tencent_EA937A49A986C9F72ED02576DBA758E75205@qq.com>
X-QQ-XMAILINFO: MBhxx2BUoWsxWKrEKH2Cp6EqNrnlbYYZ8u4kucMHho5VXlOOOhAisT20p7+sY4
	 dES31lHMNzvKruM9ByNhSr01aSoHRx4nhNCnQ7pSUMhoZjjFzqVaZCO01J4LBS3JWtysBgR/IQdC
	 aptkyAn1JhB988eave2svvgeW0BRkwefgGLXiXINiPxnq02lmFjh2sGbMmt8OBVR5c5zm/OAVLmA
	 Tf6dnQC/Myc1kNWMVcAHUj8UgLa1FROrGVDTv/HW9kWdGn1SBApOoAZ3uagOojqnR0GGBaBjOI/t
	 srHpFYRO9vlkM+3ye7oJBPkGO9TJ2/61eUdcpeUd6BPMd7AbCcvzDB2onE+tuy2elo8SYdGH+A5P
	 22SvOBTsXlJ1KKzWLTTSow/Fyg/xujVMKGIfX4ZM2d2UURuZmAHbmZPiUbkVdTaf4Y+Aw5C7Ghkt
	 8RJCyb7nEpVKQpo7zBUX3askB1w4LghzLfCYsFiebcg48jaxmeyPsRKwjoX0eFiRNWpX3nNOkSSk
	 hWzmH9osxuKBQQOAT9unaMRt0CcAG5/vwhw/PlRBCEPLfKRAkQnm1sw6lhx73YE3TLTDHZ0WNNkg
	 1VGD3tKDCyY/LEgmkox6psvuNq8ZVEd4fgI4UuCjE2uLJuvGMmDCaOGuGTPdxrAXFaWqo3/nPLDo
	 ryCpKCWBL0a+Q2VcfWfsdXjG8B7b3Z3712uABCV82T9MWKwBngye5mHylwTn7tBcelDAnz/dqSY+
	 8vLrBtsBUmhkMrpcxr5UWza4Ju5OUZKAy4SqsMPBa21Ufbp7XmkyEiJxb36NS1/IFXQ09gavXj5p
	 Oo4pv/M3SxCTXRUYSrVWyfdI3eDYlT/bLPbLKhVCZiuKNRAvrb9BSHCqrIMwzUwj0mGhXls8E+Dw
	 bgU+hawWCtq88alyPE1ecUhXPy3n3UcdXpwvfoxnIw74BKFt4c5b86nTcyvhej8mRvS8ciXi+UZT
	 c22f6BCr4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-OQ-MSGID: <0a751065-d90e-492b-aa5a-435ab621304f@qq.com>
Date: Tue, 25 Jun 2024 15:30:32 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: plusls <plusls@qq.com>
Subject: Re: [PATCH] ARM: dts: sunxi: H3/H5: Add phys property to USB HCI0
To: andre.przywara@arm.com
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, robh+dt@kernel.org, samuel@sholland.org,
 uwu@icenowy.me, wens@csie.org
References: <20221110005507.19464-1-andre.przywara@arm.com>
In-Reply-To: <20221110005507.19464-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I use Armbian in my orangepi one board, and I use the usb gadget to simulate keyboard and mouse.

It works on Armbian_23.11.1, but it break in Armbian_24.5.1.

After some time, I found out that it is cause by linux kernel commit: b13d48408e9f0aa80f3d9f93960aa49bd0da7af8, when I remove the "phys" property, the usb gadget works again.

