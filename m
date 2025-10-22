Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194822877C3
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 17:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761153979; cv=none; b=sYNT+csCnO/S7I7Lbxr5pNVbGPKYDixFgyWFKLYK6yP1qGnKRfEujrID5Fnhk0mKw6+xION6k7UPOLhHqiibrviLezN0VDKKMiAIkffhDb5H+1j97vuVLAg+eyukO0OxmKs84QS0l4wXfITkAbAXiiIKG/LRQw4JYZVSb87fJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761153979; c=relaxed/simple;
	bh=N+XnrBcK0ukSHGJYM3JWeUhyMWUzVh5xSMBaBGyWtfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gJ1GQHe0xvQ/l5clru7hwk4M7s89otj5QvxR6YCP6m8uqAzcsCYWYVnVBXSOhPQ6XXZhH76/vPCrV23yRpAiaWbHNqB52xh+cDXyV/0Em7grbT+RCBNV6YeaTGa9caiwzLZzYyN1ONUOztPMzainl273vwb/2M2QWlhOQCAWZf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=etGzxJb2; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="etGzxJb2"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-442009be84eso1892087b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 10:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1761153977; x=1761758777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTsP0NdqvJ7U7DbfTpPoF8XgczivzwEGFSISsQIiQzM=;
        b=etGzxJb2pUcLzkUNgUM8ZDDZFJ1IlFCkeGOosYqP7SeNT+bvLPbiS4KXwAo2csHq4X
         lzCNPYJ1IjhybeTszT6F9xh+bdCxzUQvhrRBll7ccuzG+KSSlmtknE+r2JLKjXV6wPA0
         NMRLrw1DMtweFcyTtyeFDkEv/dEXxvyiXvH0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761153977; x=1761758777;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTsP0NdqvJ7U7DbfTpPoF8XgczivzwEGFSISsQIiQzM=;
        b=INjzOWBTmygSONbUb1P3QdPwJ4vlqZm1B0jlMZdzAZLMeICr92kWP1CrDSKC6z55Q8
         XLFS/+lA3bqWXRvpjuy8X3fz5e3mhlWHff6acYpdfpqDZOaqgsjMhsUSj4aXHvkMpfN/
         yZvRggzE6iTlpZ+uVtRcsSlWjhquoWRFVldNWBCkqYSR7oW5aWaqVZE/JUaz9O8/d+zJ
         kaxCawk5fVj57RTL2hxxamOzeSjtncJA8TdHILb8iW2VAHAWK/4n1j8jy98xxNdUv9Rz
         iIZUA+VfKMk60eRf+50RjbyHBFL3zzzxC0bABJCsrnZrCScFZQSkHFAQW+9Lld7ThkTi
         e6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW7cxqX7RGMwkN8bGvBIPCwL7gCgFJlpg6yt4/KO5qHIaH7J7lcbnWO2hgS9zoQbfOwV5GdWKztH99Cag==@lists.linux.dev
X-Gm-Message-State: AOJu0YynWFkSV9yRpvvFCqvwyqRlDRn9N9oZuWU4ehaQErhstfHo0L5t
	QWXAwRlVAHOXstg5Vhi9jo1+rr3uR7YnYv6mOUt9PMZzSwdYcsv7hyHtl9fcANOH+mLAIiJmAKj
	uOxsAg3ZwzA==
X-Gm-Gg: ASbGncv3MpW2ap+CTkCbjiF7FGmDEVVV1Na6zL8FsumWdUq079qm9DpScVTUqadfcvZ
	rd7ZeV21wgRhQsrchDD6SESrxt8CvZVLLf/RG3ENB+IBD3ZvHX0r3Qi7MMBSfQ5MyznbIBsiYY/
	Htjt13PqhasFwx/EKca7+JYY8F6sGK0QTlwMUErt2pQDBkp23+vdFF5NB3RnDTS95u4s7w8C8LQ
	VtgoGc8IWl6Qgaa1J/uVtzyKOUtaL5zBlV33CVwyg4vdOdcU+f5du+T42p+98folwyz0Z7bjj82
	YJ/KewuYs395WhWUfq6vYpg9Sxt64S2qYAjpQX5j6G4aBjSGme53qVRTx3iR8VC+k6w0Xqxmlov
	tF+GBtKYWHDDH4h1fnUrsuELw7fLZhU8NzgqJ9dnoB5yiRL5zibDGUwGeuZabe1bl0oe2L9EN79
	VDNzxd8AIagfgQ0rRpeB/pKW4vMuHOPd0e/Q2hAnbapRjTyFU1BlNZwPogKqA=
X-Google-Smtp-Source: AGHT+IHAo22A7SwMxI6Hxkf20V1a86XQiXsYswzi51SyYTNyUgF7/DbDyFJp6Ax++3JPFTGyjj/gbg==
X-Received: by 2002:a05:6808:1929:b0:441:8f74:e7a with SMTP id 5614622812f47-443a30144a0mr9002970b6e.52.1761153976860;
        Wed, 22 Oct 2025 10:26:16 -0700 (PDT)
Received: from [127.0.1.1] (fixed-187-190-202-235.totalplay.net. [187.190.202.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-443df20786fsm3453493b6e.18.2025.10.22.10.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:26:15 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
In-Reply-To: <20251020145527.2702250-1-wens@kernel.org>
References: <20251020145527.2702250-1-wens@kernel.org>
Subject: Re: [PATCH] .mailmap: update email address for Chen-Yu Tsai
Message-Id: <176115397535.1634412.1042663139010164553.b4-ty@konsulko.com>
Date: Wed, 22 Oct 2025 11:26:15 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 20 Oct 2025 22:55:27 +0800, Chen-Yu Tsai wrote:

> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address.
> 
> 

Applied to u-boot/master, thanks!

[1/1] .mailmap: update email address for Chen-Yu Tsai
      commit: b27705b9094d349882e6c7411c325c9308f68e63
-- 
Tom


