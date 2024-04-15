Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC8156236
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216633; cv=none; b=BGT+WAUccZqiwI3vMIFRIzqJ3KoarOvpSWor4o4ZQI0AhsSE5oyxCPfVw17QFBJtdMH6rwuWVSpoY1x707hahRkyoJ4AZWZmVWU6HLCw8XyyIqs59Ezm+KuD3GmTRrmRI1WDnGPFZBaxzK9KJMggExXPEtyH7enC469fh/RRx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216633; c=relaxed/simple;
	bh=JtZ7+KtyDK1OPu+K6I7cSseOL3/7Hx/l6JUARwK22w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CsFDvjb0omIm6QTaNTKDZPw+vuXlNQtOZDTAhdUPFey3Z9sMp/0/+wexv45LjSba86hTB1MRDXhsVDSujaNPoOxSMNaRswLIfyJwWCk7f8EGT6/VRelg53o9dVphdWpkCsVSh3R0PSiwfp7yHWFJxj3eWc9JgFtTJhsVWgpWHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTusmC5B; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTusmC5B"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41892a751faso81225e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713216631; x=1713821431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3UenIt43MR55osoDYYHxgKVrMxBgUF9iSo5nPwqTj4=;
        b=jTusmC5BM4CUdj0wrPMKoozLSKJJW9aYcvV9CBin5gZGo57sCypnPqP7y2swoYH01i
         JB5HdKqawz2EVZdU335uG4zuQ9VoWsH5RwzbdMYqftmSTskgah6pLS/iC8fFeJwtHyAv
         bLx8jp2RBNDLWOYVIJni75VAyWmwezPHxlclDu87G8fE5xcsdj2aDE2jJRgOaFs2NODo
         Y+bheRKN1QYcMEwuyV/BKKx/Jaq5oNj4xVa8dMj99zQtq7wCNgMF10Az+eOOKpOhz9oJ
         M42+EWrNfo5iAKWq3mMO7+oc66EM22eQu9TPROYhdls7vP1Y8CQjPfeKLmS6QNSmTRkh
         r09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713216631; x=1713821431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3UenIt43MR55osoDYYHxgKVrMxBgUF9iSo5nPwqTj4=;
        b=dyIhR88/eVyMTgPAgUaSRuZAS5kPH6IAI85qd6hYzB4NETu/FfuvMuHbgohJhgaWBn
         4vN30cpRI9tx9ergYd5s+PeELQKS2BtBgZ/grpUGWk4qvcYPqHs60VP6fZgn0NkG84gM
         ts90IJpMw+4YYgDJBb2YadGjcA3yYAQ5CEO0BRHoNCKuWoGofy9Spr1pjtCYXxtUoREe
         JNxayk85G5fAVVcedKSmjr43uhxrvd6FfcPKvLBXvP5VENOW+FNxCEH+zB11UFYR9k/w
         nlJhrB3Zqa97/V2Og4eoluTsRZuFv0svCcWOVTwhGKm91qHvk3FahHhFrB5Q2YP+rzCz
         xCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3OslHuFq4vJ1sAjFzLRbrzkRnKtseqzkCBbdqgWd1ANif7xhYZ7PdYpfmGDMMG+Ly2hEWfQZU+XbjYfpGBCLpcCJX8RD3TFE5lcU=
X-Gm-Message-State: AOJu0YwR5cPB7JPYVUw/Iz5ptKbMXFwEQb5LD1kYUgBTrx9YPoTI0FU5
	SUQ/WMXahBJkpx5sf2h3vOPjPJHqHOQInuEJFsSGAmQy5Zq6lw7F
X-Google-Smtp-Source: AGHT+IEwUBu5rbeR+NG06wmX6iS00FXzbXScxtwmPHMX9rL9YKp0y7tJFVOwnT5Cr/tvT+wNXf43WA==
X-Received: by 2002:a05:600c:3b25:b0:416:2a95:6e8b with SMTP id m37-20020a05600c3b2500b004162a956e8bmr8060461wms.26.1713216630661;
        Mon, 15 Apr 2024 14:30:30 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id c10-20020adfc04a000000b003467a420243sm13145756wrf.12.2024.04.15.14.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:30:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: fix module autoloading
Date: Mon, 15 Apr 2024 23:30:29 +0200
Message-ID: <5929348.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20240410155420.224157-1-krzk@kernel.org>
References: <20240410155420.224157-1-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sreda, 10. april 2024 ob 17:54:20 GMT +2 je Krzysztof Kozlowski napisal(a):
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied, thanks!

Best regards,
Jernej


