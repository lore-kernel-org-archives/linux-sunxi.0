Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDAC1F4717
	for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660249; cv=none; b=qHc8W6pi7zHOyVYUgIaQEh8jtOa1DEZf5eaoEUqnpy98j6Xgg+8uyMtOLSIjLuvpHTjsCP743r4F9N1JRPG2errlgDsFEqpGTEtLtNnR5nJhaCRfsuldz2bo2Exttn3QSn+sYjdWaoqVjPoCUbxpVVs4DiIe5+Vf7LMwECFXUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660249; c=relaxed/simple;
	bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULitqdhBkFI+9YapWMBaei5H3Eu6NlRZ3rbg/tngX2ByNmsQww46Mqwo02YSURloUSXs3eyswq6LVV51O8hvp8w2eFKzk+sbqX0qd1o5T63N1uZH0hrtVbQWNRlNSVatv1npIMVR/uMdZaFf1281SLaCvzCvZ/iKNeu2WttQNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5191032e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 06:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660243; x=1748265043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJw+hlbauIF+Woszu8rX7v1wJgbD5TwAMaCcWAZytfQ=;
        b=bHjp9kudGMO1/j10nbZPh2wuZSZsFPucZzHivMTOhF/HCJnHjRedT/yJiNIHEhT0nU
         HTBqnc0qCkThY+cA15zsLkffR/geSQ/Bmcgqq+qXQ0KmZ/gYMieaTD7eVCrBYuIOnk3E
         COYatdnCdkBivTf6fHttYCPqXjq/PcTcmu6cVW5x1IwySgps9v6s5tNNB2phcshy4mPE
         bpR4XSxFYMzjr29ZBYJNgjLYgIEgZmXGx05MoOc08VeOIVZu0fPYqsfKBOykeysTI4IP
         q4E5l31ccrdT2KEqVEXgdmBoyvpJYgP/TMphgPNLIOrroQ9L7EBz2ZKRNLL7TbXcpQnU
         D1yg==
X-Forwarded-Encrypted: i=1; AJvYcCX2OBQwMz3zRekwJiHL7tPaaRWMPPCbwHdqiButX1Oef6x8oMRaVKXZuOEts46RBp/FpQ4rWL3aSo5JNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRZb/PpvPxnTPAKQuK0JEy0cs55i3z7cWmvsHysIFnv6+5KFwJ
	PbjC1i6jSaqiVHly67e9tnAdm89YveYz5Zs3d8/bJr7SmuZAnTzaR/vtGnZ4JHmqQxk=
X-Gm-Gg: ASbGncvwfP3PJqn54I2cHGDhORee8rtpQb0vXQyOmsnaqlGN5I+GeM75WVu4tDNmwR/
	cqr3CiC+H2nGdULhNzqAeMbp9u10Kx36BWQkx7uUCkdac6AMH3A+wbWhtGXD3SCYBZA7iLFnYl8
	xXIA8J9d0PSQZMM1rYmdgclobPEBz+85M3jHJONnpZYTqZ+gcHs7se7iRSU+U91bKxeCaJmm2+o
	FbI5fy7nN7463DeUwZ05ZyRw+IoDQAfWopCHVmBtb6Q+xOOQhluY39wXsFQDyzVt3rVFGiHOYBU
	EEuqMRt5i5Lgz77qmEQBJReulwCYGR/E5wDIr4CQk8w+msq7wzCtAjbvPgY4+ijHC5339hVqEMZ
	Vxk35QOhUziVg1OVpLF0=
X-Google-Smtp-Source: AGHT+IGt6i3YjsyUKbj6kQVh+FLEVZ1SS6CRokvILlWlBr4gchi6s+3njGXivIAP/cWdBJ1OiSZCNg==
X-Received: by 2002:a05:6512:6301:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-550e71b4a93mr4133264e87.16.1747660242950;
        Mon, 19 May 2025 06:10:42 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702a289sm1864118e87.163.2025.05.19.06.10.42
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:10:42 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-327ff195303so36011441fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 06:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxUt/INsFS3R/6bYuKcz71oquq5fBYFqHxc6VqG8x/mx1qbrCMNVtjgkDwVCf0dc2hMPBCZIBHfyzrHA==@lists.linux.dev
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr32090081fa.0.1747660242500; Mon, 19 May 2025
 06:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com> <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 21:10:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
X-Gm-Features: AX0GCFsxXp0f6XTIbmnJnSjvW3P0HJFBLSxCw1t28jUvhSs6_4fuwFkzC0zig3Y
Message-ID: <CAGb2v65FnoVMaoHYWWsWCcPZe-khw0G=jkt4MotnJemf2xPN+A@mail.gmail.com>
Subject: Re: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO
 based I2C busses
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:15=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> There shall not be a '-' before the number.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

If you want the SoC maintainers to take it directly,

Acked-by: Chen-Yu Tsai <wens@csie.org>

Or I can take it after the upcoming merge window.
