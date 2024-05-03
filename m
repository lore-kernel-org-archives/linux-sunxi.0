Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A765157E94
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714758028; cv=none; b=jl3+ThTvQCXL/8MsmzMeWlUEjo1LQszUg7uKM2VVf+OsdqZ6rgvJS5MfOMx36PIP6ThjtamNP9WdKukSwy2LLTNDifjK6sU8iNLcowiQZ1YMMf7uQIgA6LpFwhHHl9l50Ykoy9tHqpNt7kp28aeqV6grd0lA/H3c8Hy285eEaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714758028; c=relaxed/simple;
	bh=iLNBKvxVPf32Od+3zH9ykAeTIbVNWQIlPDyS4l7HpGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZJHT3GJwXQUThpygs1emDDAzFqubGaK5o+JgJtU8WXK+wlTe+qjf3o2zbMovafzN8/Vri8cbfLG/kWHyZuugJvnPDXoEDV2k6111gtYY828SB+09GdPxMvsffkJw0R/VCUkaxdl8jbkMjPJ+NBhmKKBM1AC7pZ3sz7VWYVO+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EKOJkaUd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EKOJkaUd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso2360788b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714758027; x=1715362827; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/82xQUaKpHFd5ja9o3RWf5MPJG6Dng7hHHVkQIw1XvM=;
        b=EKOJkaUdTnNuVyyIY2j7C6wrriynRBQv2SL8EpfLLi6sevmz8tvwpG61o/ELeEI75w
         JsZuhB2HUob1/iw6geD6f9x1MzxOfsTuLoQa7H2AVZyxFUbwbLV1VDdtsjkP+c72Ck2e
         FkIt8wdKqlo+6MsgXdJeOUZhkpqlkTsILtm6bA0LSIF3fkLCiMHeLggz1EEMLJ274e4N
         GMpRldyi1oAq6iGp/aiHiwQEKM/VwxzDVPLfPvDWo41oWTvFHCI+3+h7dF3onZZu/lZV
         Jg1DFQy2Czf4y/uU8+NIEJwMp5NPNsaBr0va6GWfp876DDxlbTL0KGHMO4TAlyQQTCd5
         A3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758027; x=1715362827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/82xQUaKpHFd5ja9o3RWf5MPJG6Dng7hHHVkQIw1XvM=;
        b=aUIWMsDTflpZV/5YKXaftVv1k7R6WGgPn0M1hWWKXmb04LNVFv35k3laLAiVmc0Axw
         dbwIzkvXTjmJOf/GcVR1OsdlE8XRqlaIqKEtR8ZD+J5QpSfKcc81R/cW8fp5xapy/LyS
         4VrgiH0L6VnkA2xa7DcZZzdfEPnEuTVst6aOzXQY7zcMPQ73jIMBKUaZ4tpFvIfod2rW
         cleAFyAuWAmc/NkrPb33vg9IDTTxzWQdR8CeVMPQq+60W0c6rce5BeJTanMLyRWaR/+V
         i5muWV+g+QEcRUIIcmqx5LEE3M/0YbpHBurQjbsrlOvzIyzZBS1BjhqdMG1T4bKiOlHX
         q7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVoXTtBqST0a/vwdDW+6p6FkOE/hxXD/dmGUZWEWci37KeE9jXrPaw+KfdzWdhiqyxUW8oiyLi4lV03kdFQqEYrFVLdTLFZOoXOfpM=
X-Gm-Message-State: AOJu0YwyQIX+3QPmGJyurjwena98wz/MTrWhSSB6C6uVQpoKHTj8NQk/
	g7xIKZTA5zVKomxVTEskTgfB5y03skryDCz7hWCjIeXw0+1nfHUs49eDLx3ZByM=
X-Google-Smtp-Source: AGHT+IFdJAuZ+3YLpENTV6h8pL82+IWNvGqri0KuLJzvvm8LygTuWoEoOCSYyZZSLsJ7Yq+5DGYxOA==
X-Received: by 2002:a05:6a00:27a1:b0:6ea:c7bd:90e3 with SMTP id bd33-20020a056a0027a100b006eac7bd90e3mr4451974pfb.14.1714758026783;
        Fri, 03 May 2024 10:40:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:f8a2:eea3:33:d368])
        by smtp.gmail.com with ESMTPSA id m8-20020a634c48000000b0061ea00c2aefsm954888pgl.55.2024.05.03.10.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 10:40:25 -0700 (PDT)
Date: Fri, 3 May 2024 10:40:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 03/17] riscv: vector: Use vlenb from DT
Message-ID: <ZjUhh4tts6+0yfB/@ghost>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
 <20240502-dev-charlie-support_thead_vector_6_9-v5-3-d1b5c013a966@rivosinc.com>
 <20240503-zippy-skeletal-e5f63c9f17c1@spud>
 <ZjUbpKKobaLXhqPz@ghost>
 <20240503-reviver-unify-b07f33cb6053@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503-reviver-unify-b07f33cb6053@spud>

On Fri, May 03, 2024 at 06:26:58PM +0100, Conor Dooley wrote:
> On Fri, May 03, 2024 at 10:15:16AM -0700, Charlie Jenkins wrote:
> > The DT is improperly
> > formatted since it has heterogeneous vlenb entries and has V enabled,
> > but since the user disabled V in the kernel skipping the warning is
> > reasonable.
> 
> I wouldn't go as far as "improperly formatted", as if the harts really
> do have differing vector lengths, it's correctly formatted. It's just
> not something we support in Linux.

Fair enough, not supported is a better term here.

- Charlie

