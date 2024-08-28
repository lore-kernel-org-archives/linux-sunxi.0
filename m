Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9F18756D
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Aug 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724859931; cv=none; b=SPhL0NrdTp7FMj7KucaFKfr+TVivAwJkaeja44GpXsg25lVNiEVQlm76sd4GraZi1E2LG4GTdfVz02D/4uwh49AknO1+9Yr2JTDTNPguqo1DA7p3IBrhI6JXztCNiEbqQp8eiH/5JrAPCBnooGlBsq+u36ke991O5mrevGodXW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724859931; c=relaxed/simple;
	bh=9rDI0xYGqmCC8+sKfivqoITazVvLBqPzlZCtPeKME2I=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=TA+gaSieptHF0ngTQfgLrstsQg35TKtKdbX4ggxdd5aWdlYD78f5BAHKpLtSonZhHVFVYq5rFYuSfkrc3D5Hphaaz0jSckfmxUZo3D0sIvbxR+Eb4Umv1DDDICEpry5nDKzFYO9xOrVXEZah8CJdg+HLtm1xiE2U/EJlDGPstFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xolqg+5L; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xolqg+5L"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6bf6dedbfe1so38799086d6.3
        for <linux-sunxi@lists.linux.dev>; Wed, 28 Aug 2024 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724859929; x=1725464729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZOUe+6mBEPTZP4TSVhRf36gjDMv1iagTqH5nqm+dEk=;
        b=Xolqg+5Lzh0ZjDsDnBotIINeLsSINryF89/RX5Yd1oXV+haXMP1N+bVfPWEOoE399k
         TD4jfyZ2FX38Ilx0u/A7eGWqJxXznaZqetFvx/N5yAW1NNllGgtHpsNZI9MlPselBd9s
         uqT3GQejsqzCaJ/Tcu1W+QfbNO9O1Woveq1ZguTbR5BHTF8nlrCzCScgzdK6KE6Od/xR
         VTCUKQsXx+GpoBuZ1kczbxPjrCCGWZxHmylnduJaVgNEwoeLwhj4pRhV9Y8jCKRO9ktE
         1i77/L08MRO6OXFnRa+UH7uwfB8rrySNn6g6oU6Fd7uhCMJJU1azG66dFDuFWyohvFaJ
         W/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724859929; x=1725464729;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PZOUe+6mBEPTZP4TSVhRf36gjDMv1iagTqH5nqm+dEk=;
        b=PW5BfBAUxyH50rMzwAUodMzNmScs6/RUS7GPuk9zS3/gHfNLEsL5iycrZ7ShZcRLPO
         odDdJOJK2+tJRYtxpyv9ECILqDHRDtLWabZohzUZqesmQtEvtk+xptH1OMwouC/SBAiF
         iGTco+iCNTPLVm8hq/d4XBhOHGjd3xtDvL8+lxPDlFMk1qvi/RK1KaeI389uZh8IBXDS
         qGLzEBEPiPzu9DyElEi27OwFStpgp4EOePe7VKwygZKuELF9VHOzIo4oFpeohN/huvwc
         MvlN3IHot+qR+oVzduR4tCICral0IuvX4TgUPyqUpokqrI4Mud+qAXyYNvbsFVLpdViG
         LU5A==
X-Forwarded-Encrypted: i=1; AJvYcCXC1w9PZU7ad0fwtj7oUY8Zzt4l95ya7AKI+LLiXLu/zpx9xbRHW4MvqblnCrTBd+Da0WMBDjmiwdKFcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnEJCDMK8QLONtyrIosY/5SZJLScG5ciuD5XDEzMsCfk77km37
	VwdbA65BG+DOyLibMmepgF7zP8hYg0ZE4M8Cr/Txp/t4OkneC+3q
X-Google-Smtp-Source: AGHT+IFQmS19Ly4t1qu81gaSL06dZhIAsQ4bEbru5NbdTJjKT/mLIQ+HckN7wPPi8lsCzxxsTBJIfw==
X-Received: by 2002:a05:6214:3c98:b0:6bf:7b7f:68e with SMTP id 6a1803df08f44-6c336337142mr33041406d6.40.1724859928753;
        Wed, 28 Aug 2024 08:45:28 -0700 (PDT)
Received: from localhost (193.132.150.34.bc.googleusercontent.com. [34.150.132.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d216fasm65998426d6.22.2024.08.28.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 08:45:28 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:45:28 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, 
 woojung.huh@microchip.com, 
 andrew@lunn.ch, 
 f.fainelli@gmail.com, 
 olteanv@gmail.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 linus.walleij@linaro.org, 
 alsi@bang-olufsen.dk, 
 justin.chen@broadcom.com, 
 sebastian.hesselbarth@gmail.com, 
 alexandre.torgue@foss.st.com, 
 joabreu@synopsys.com, 
 mcoquelin.stm32@gmail.com, 
 wens@csie.org, 
 jernej.skrabec@gmail.com, 
 samuel@sholland.org, 
 hkallweit1@gmail.com, 
 linux@armlinux.org.uk, 
 ansuelsmth@gmail.com, 
 UNGLinuxDriver@microchip.com, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bcm-kernel-feedback-list@broadcom.com, 
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 krzk@kernel.org, 
 jic23@kernel.org
Cc: ruanjinjie@huawei.com
Message-ID: <66cf4618f313_34a7b1294bb@willemb.c.googlers.com.notmuch>
In-Reply-To: <20240828032343.1218749-6-ruanjinjie@huawei.com>
References: <20240828032343.1218749-1-ruanjinjie@huawei.com>
 <20240828032343.1218749-6-ruanjinjie@huawei.com>
Subject: Re: [PATCH net-next v2 05/13] net: phy: Fix missing of_node_put() for
 leds
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jinjie Ruan wrote:
> The call of of_get_child_by_name() will cause refcount incremented
> for leds, if it succeeds, it should call of_node_put() to decrease
> it, fix it.
> 
> Fixes: 01e5b728e9e4 ("net: phy: Add a binding for PHY LEDs")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Fixes should go to net. Should not be part of this series?
