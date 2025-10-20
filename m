Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC85A331A6C
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983083; cv=none; b=CwOsWg3tNuqOTOvL7y7SBbYWZZ66y7PmxWb5Kh9OV0jSAyPWaNM1eNc+Zbcy3JRxoi+qUQuDNyX1yrT9qGiC9ITpGTj5Z9Ey/0fy1POHx3RHYFkoCLWaQD7Z4c1AxNanz1NpueGh3EMtLD1fV1+LAIg7Q884lBu+UpF3TU9blQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983083; c=relaxed/simple;
	bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDn33FF0obxYwj54Xbk5aoPs1VZp8aDlvR8sYegukbeV/OR4dxxBoBrjcpVUqhnL7vIWn9ucncUogCXT+sxzAyN4Vx05yE1wCe/UQsVPdUaXAyt5XFlFbCmJsm/r/TYqDdmw5AZXffRm3+Lh9BHi7xiyZdsbj4TAO/a7FRC/Qpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zi48pHKu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zi48pHKu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426edfffc66so3444012f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983080; x=1761587880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=Zi48pHKumTkLTcL8ycGWHgjrYagN4z8UVSIGRKfN8jVlTl/2tDTU4M4QbuunB2STnY
         exIVH6kqYTizcX1l/MqPweH25JB8ZY9taYu2Rybs8BCIEbGfiiOJFVXkZXG/YZAcHQ8R
         0Zp5O5mCqWZJOr0WDrEo/XUJ+oMof3elEBn8mVAmkBAucP5FYkHuch2KxQyobgC6yAvn
         INQuJxAsgLd3+T5M+p90SFfDsdL3oFTpV8U1oaG3WOREs7qeJrGBfWK5ft9HxaQ9C1KR
         ZQpMMCxgseFaPtg1pilWdz1vJECuHWpc9jjMOqMjx5sXa5PEjkfsFUobqypHyc6WdZTu
         ZnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983080; x=1761587880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJYNXDViBNg9H23IU+cEG/iUlaVVosMhC4bKdCUk1To=;
        b=rYQoHtN56Vo6n8AyYJGSSL2yYgfrp5ajyBRhCq0GL80EwrYc//bzH5hMN0v7mBK5vr
         dEeljgWjvAjA90nbmtcrCd+nfCuNQue/su0p//9M/NODYOwEEeBMvY1IKdsjZAgwmxOQ
         6QtxvOoxW/IqCRZnik6HLvH+2Qz8PEATS5k2tltEXaKlXa9C7cRQyunZFEJtpqWQeSGQ
         bArdGhASC5r8i0oZcXDUT8YlHYMCoc5j+dvpjnoo+1c0z6PzuKKYCd6ITAL8hdOfsid3
         ARuMwrlI4BZKnLe3cwiS+AHLJBK4AjwkAltlfiSlQ9e3VAu1kWFnZfpHsSe3CybkuMWh
         4srg==
X-Forwarded-Encrypted: i=1; AJvYcCWNzMms67CL4KPNxPpK+E2hZQy7XRw/cf9PzMNTqDTuwANyobF9yjAJ403qMwfRJpoqroGPoU3MBltG9w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5X/3FUHxkOT3hzzqSGmdPjQlczTDYW2o/ykYiSoXTHKHrOLnP
	RjOeBkLQZgyqo1p4z7hyVTxYpRdcSmmBh78u8UvgbirWekbPm82L9Z0y
X-Gm-Gg: ASbGnctLhWDAinBk2sJnte0yE/Pll7NTe6naWNF9sPbBkKXVSZzKMa3tm/U5VEKT+5i
	WOaiMM4bAJM8b4ps/QglQM2Cgs4GducXSxmNhzM5079OsNAm9FsDYq+3FRPUMRq0SL/SzW51Dgg
	/koHMATgLltlRffgdSitAllBDI85zfhOAXcJcgBqZdLqCxe2SODIjAv91/DcJXbsMLMw+1Z0qi3
	TSa6JAwgDcGfCYF8F4r6BJz9CeQZBA3rohQvh+OdX6QHfStI5iKHKD5yYBMEERajkqc9JyEk6v9
	vTNgQ7ZqaSG1Y/jajYHAXQFgpPmnFB//zkCbNIQkQQTl1HxWyLdZVPSjZ5bOlXVyzTC7gGmUJgU
	4PQthzNYWTLEZpga5YJuBrQpaX3FrlIU7MozcBqWrb9ZGOsJUW63IqgO9jfoRyoUQ7b0sSTROSL
	PpefjKLZU40/hdOutghHcF1k88VAzw1IfmvKdHtacO2+OzyVu5mAFNwwZ6itgR7reLsOim
X-Google-Smtp-Source: AGHT+IEQQl9YZkR1BgzZ6Z2Nufpu9HBikDewEvyF4EuaS29j/RILS2DM6SBqWX87g+1TkKzsAinQ/A==
X-Received: by 2002:a05:6000:705:b0:426:f9d3:2feb with SMTP id ffacd0b85a97d-42704beea1emr10367539f8f.23.1760983080172;
        Mon, 20 Oct 2025 10:58:00 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce08asm16294878f8f.44.2025.10.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:57:59 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 07/11] arm64: dts: allwinner: a523: Add DMA controller device
 nodes
Date: Mon, 20 Oct 2025 19:57:58 +0200
Message-ID: <2324646.iZASKD2KPV@jernej-laptop>
In-Reply-To: <20251020171059.2786070-8-wens@kernel.org>
References:
 <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:10:53 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523 has two DMA controllers. Add device nodes for both. Also hook
> up DMA for existing devices.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


