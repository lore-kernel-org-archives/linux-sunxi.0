Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA6B1AA1D3
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Nov 2024 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096897; cv=none; b=LJsypm+Dva3jDeqsZtBExpeA0PL4dcaKsIS6JfVLW6yeCamHVnNBv466rBIEfNJKTSgy6kebY4H9lumv+kSxcfM/W/mq+l1N4mYP+LrIY+nhhe6Jkd6wwMvJEKwd5wIi+xFUnVE21nV32uJgrQHBNFq+j3pw3ytEcKlORbXojj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096897; c=relaxed/simple;
	bh=YH3LNbSn0wPVEk/wOFHU1OMDcGX+bTlPteohwZ97IvY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=pSSWbYnTmT0vttuwbmy11tyUeU93OdXNzxGvdxZm8Hu/DXLj/mB2gkt8IkZiqy4QsuSUZGMiPc2uVkijDqmRGQ+e6vvklKZqeAIGljyR2vF6itFbLc5eDtDIf3Tcl/tDJFPUyokbYrtDdhGnTzavFnWMBLeKpb8OReuFumNASoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com; spf=pass smtp.mailfrom=wirenboard.com; dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b=C6rhf/7b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b="C6rhf/7b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431ac30d379so21380695e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 08 Nov 2024 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1731096893; x=1731701693; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=;
        b=C6rhf/7b05USOy4EIxTIZBt4b/rUPOfIy0Mht1HQTCmIr2SJSnck7xY/Y8TFrviZC/
         JZAjFDPgobN0e4rSZb6a90BclpdpbjlLuS6J7AUvAYiKWf/eGeX2FhcYKq+6zs8MYeES
         T3f+PfcftHWUcrBsKzWrgEzPnodg/2nHBIg5LkHCI+9YkVjyfsOid2bkcRPOB6aO29gS
         yxYimlOMGD9v38EGy+hYTooeENzjkjs/rIHezkaQyArcq8/G59u8FzRttEcpyR8HY0rd
         GecdfyfMftvISwYECvffOZGN8N47ILhxytqn1F/nN/Gm9CRIi7KgT4XKF1hVyN8AcFy4
         us/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096893; x=1731701693;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnJi290h8vr4C/mD2ddPtqPV3xjVoWTEKK5WxcOCaRU=;
        b=UqlW/qI3GEhhc58C3XYOPsmjmkGx2txL6VnoZWjpp26dRaXCIEfjQ/2PF3lFnhz9XN
         1OakLbU5I1SolTC82TjPRBddbcA7WFG1nO1H8dkGfSWdHfNgGhAp9Ilum1MjVOCBht0f
         +7jiY+l0Ctwt4gxOyG5sBCgt9EVx5YiTiakjZXqHQVIBtazlUyRIE29k9iWzwaNv7rV4
         qyPShHT6l29QDAB2T5wvEV7tmwTsMUdb+Xz8PVtQZvfbSktHwzGWPnV7cq7ONOnWtjXc
         dt2fVzjwx0MghZKbDFszK/1IB0duhKLg5jRADTge9ePTeMhUOyWcf4VfU1LHV8UUqeiI
         N27g==
X-Forwarded-Encrypted: i=1; AJvYcCWITF+87ojw23Tg0EKTYQrW9hUTRd7gYM6kIFYHKgqrtKzGpEl38XIPpJiv/yRzntweUeQW9XiPBa15Dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVFT4nqGY4GzB/lHmVLP5aisdg1UEYdGRuyFhies9oxUZeOOSY
	HTajNnefsf8QGKN4Zl2OhbwYo1T97EAJSbYbohX8vs72UG9+TEFoobUjXXIec6c=
X-Google-Smtp-Source: AGHT+IGN5sV2BbFWTnqEaNdU1iKUMM5d5J1yjXajKUVbx428HpwPMeTpAjJj5+kAG/3PF10HUkZuzw==
X-Received: by 2002:a05:600c:870d:b0:431:4fa0:2e0b with SMTP id 5b1f17b1804b1-432b7519708mr32564385e9.28.1731096893182;
        Fri, 08 Nov 2024 12:14:53 -0800 (PST)
Received: from ?IPV6:2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49? (20014C4E24E5BB006639286E9EA6BB49.dsl.pool.telekom.hu. [2001:4c4e:24e5:bb00:6639:286e:9ea6:bb49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5b7fsm116672495e9.4.2024.11.08.12.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 12:14:52 -0800 (PST)
Message-ID: <7b63b316-4cd7-48ee-ae32-3750d25e2307@wirenboard.com>
Date: Fri, 8 Nov 2024 23:14:51 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mturquette@baylibre.com, samuel@sholland.org, sboyd@kernel.org,
 simons.philippe@gmail.com, wens@csie.org
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
Organization: Wiren Board
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Evgeny Boger <boger@wirenboard.com>

We had stability issues with some of our T507-based boards. T507 is the 
same die as H616, to my knowledge.
They were fixed by essentially the same patch, which we unfortunately 
didn't submitted to mainline: 
https://github.com/wirenboard/linux/commit/dc06e377108c935b2d1f5ce3d54ca1a1756458af

It's worth noticing that not only the reparenting is mandated by T5 User 
Manual (section 3.3.3.1), it's also is implemented in vendor BSP in the 
same way.

We tested the patch extensively on dozens of custom T507 boards (Wiren 
Board 8 PLC). In our test it significantly improved the stability, 
especially at low core voltages.

 From my understanding, all Allwinner SoCs need to follow this kind of 
procedure, however it's only implemented in mainline for a handful of chips.

-- 
Kind regards,
Evgeny Boger
CTO @ Wiren Board
https://wirenboard.com/en

