Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606047;
	b=XENONZYUyYhCFK4JstJFXyyuRpuuhzimseZxxKnpgYN22MERB4XpJraB4/ScFLjAag9R
	 3M80W33pBYZeuUbHHyuzc3gQBgDnLMdMKEn/KtZ6tEFREfiLGRJoW+zZGRYcCWprkzOcq
	 6YHkS81K7uyUgYFnI3YLhiJcSw58MxngyDvGy6TVcfUC0CxsmBoLWokc2VzTyHd+RngS9
	 VoLogNcuXEFl6E8i4ZPiFT12G3+YCtg/K3i4vcoXf1Y59ln6hT3riuOSR68Ehwyxyxk9f
	 F54Nf+Scm84bOi5G+7iVbGvMQWxOX1bNIZxv5uWuOouVvLmVky73TtW0kAVzWrbqHlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
	b=dBrAfvdXMNy5gkTrVrOhfFpq6c6cjqMMiwBuITzm8mcssgINCVIechawcPfHRQtySVoh
	 wIlrHJylQb0j0jLUTGy5GqLdtuQCvStGm301D9w+5RYCHycSygYXx1yIGdC5NV7KMQC36
	 csKM7IQFkdfkSRQERhsXSHc7p3nOOE19MgoSbSTcufMtdtTWxKOVK/dv/JnTPlqNHaAuR
	 9GHl5TXSVq2WSYvKnWlm8hzNkEPbkR1pgu4tMzJ/D+YXb7LGrYF7oVdHvU+SulI/uUQ9g
	 Lnkfezpa1SieCLzJX7jYltsQJ8G6smZJrEA6m/IkWIyN0LZRRPn4ZfuzayMI0pqwHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PWnkukIH;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52797606A31D
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 18:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52797606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PWnkukIH
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac925bac3so209247e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792606046; x=1793210846; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
        b=PWnkukIH2E5S+T5kkAejtEh//saAY8F7Z1Q+PyM1yEBnLRevBzNEADMsICKoj4Uesq
         jTvFYJ6pJh407HjTJwyAD8rpe0oweOeVEzOcKH0eVtOkRtgpsa8UA6JIR54vZxQp602O
         9eY5iEaII+cw5Z4baDmcsO7pxNc+dc4InW08bWNOPX398HXU6SZ8H94nAZCVUzQNWjvF
         gTG3y1pEcQdw7PnabMTA04oX9MJvTTYw8C3Ah8+ydtMLcQLPaNRpxs+A1vcFWKvX4t4q
         Z/DnBHEYq0uB4bJraDh9RTQLjgqDOwcsucf8n9CmW24XLDNzA9fd9eb0wQn+NaIOAWlY
         OvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606046; x=1793210846;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD3PH8sn/SG/F7DO7wxZvYQbvmrfrsBI3sjtEwqgqnY=;
        b=2fbGrrVRApkGkWYP4EL1IpbGO9++DhLmyejaJT1MlOvM7+noZgAmgj5/xB7HV2DzJ5
         adlA9K7or5giZFelY/S4oR1liN6Wol5b2aWQVN1j3q4FeKg/ouE45nBxp74w5TS45bUv
         G20n/88mO9rNKIaPA+zLla+Dclr4vlQgcDwHvzwMe7mlqSbToXlu7yIYMB9OnyjV8c1W
         Ss7k4BMGd0Nc54zv2laVMcHi0syowV5vY/uaUBxnS4szr080lkPFaSL3hTuxSbKx/ibE
         atMDr1DqbEIn/kFIcz+BY369mcmm3Wd2W8BxaIATiJsyMyUd6I8msyNev4uld+f4p3OS
         raMg==
X-Forwarded-Encrypted: i=1; AKwUvBxyqGvcD1Ud3AdEcXxBu2rxCPMqf1Vf5HFDxAHuWZSZlhH6efvSiGKxjr+xsxrzQ7YHDQ8UwQnnNwSspw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKcsk3bsVOWyRnpZ3PpN+Yt9EriPt5K60bA4KLQMWW5S/YDuw7/
	eviWkmJnP+QkdG1EoMTku7/csTHVT6ZPuEHn00E4fefska/4/nufIHkM
X-Gm-Gg: AYBFou0a2w1aye/hKGBakjudlD8o2KF9voUj+s/+eQ2Iz6e9gUnwh4dqYfIdGEvfzlj
	wkFmD6bad+3LzRcjaXcMN93SfyePqF30PeN4gxCP55NkZJ3l7C53eH7vLJEzXJ0Ewv96YFR2O6t
	O8HUvACSoTylLnc1LaW5wdCOa6+hR07otov96Pk72+UWbtQLwPRUxm5Z2fRo5EmD59mwM0zhaxC
	CGcqqNg0kJ/lPZntLuRcO6J+UwG9AUD5CSGNc0swiID1nFn/Gv3rU5xraBqVEshiXNbYwUhUYI4
	nRW2ul+tIE9f7IIOlJS5xKBpSJF6F8cApYnhIzgMD6Y8wGAgZ5FeVcUj+1/dZyLR6oceIOFdChB
	lOL5cmZuw7MJTmW1QIKIMUATQtvlsF5j37g+Nx3DTrgljEHBTNA0s2CPhXW09SOgmOdwXYBYUW8
	Ow1IK9KAzeCnI5VaxBzBUMYulJqXNZiG3giOpkmY9dvcAIQRIC+FPomzycfbyfe7XSRS+fyOme5
	E9Pf8y5t998JjhaN1ZZ/iYUqA0JUAFHi1/FcE4QNX09DjWxud28zdhiqPfBSKJBkTSmgQ5rnyxC
	OqY+PGLOkx5ijHXHuq6FIlf6++wNLwC+k02OqPrRVtE07e00Hf1//jBWhrIvpHDM
X-Received: by 2002:a05:6123:6d:b0:5d2:4a4c:ad83 with SMTP id 71dfb90a1353d-5eaebefa0bemr1334431e0c.23.1792606046270;
        Wed, 21 Oct 2026 11:07:26 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9697814sm4054490e0c.1.2026.10.21.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:07:25 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 15:07:14 -0300
Message-ID: <20261021180714.473749-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atj0iRFTxHKmhxVG@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local> <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com> <atjqZPuAbHDdaexv@ashevche-desk.local> <20261021170403.2052449-1-vinicius.eduardo.pedrosa@gmail.com> <atj0iRFTxHKmhxVG@ashevche-desk.local>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Yes. but is it only a single device/platform affected or a big class of the
> devices? I assume only narrow part of them which unfortunately use DFL register
> offset for something else in their RTL.

The A733 is the only case I've seen, and the false DLF is what exposed
it. But I don't think the BUSY problem depends on the DLF offset being
reused: with a real DLF on a UART that isn't 16550-compatible,
dw8250_setup_port() also replaces the BUSY-safe setter with the dwlib
one, so the same path exists. I haven't confirmed that on hardware.

With patch 2 the A733 no longer takes that path.

> It all depends on the outcome of the above discussion. Maybe others can share
> their opinions, but I lean towards a series-as-a-fix rather than a bit ugly fix
> + proper refactoring on top.

I'm fine with a series-as-a-fix, and with deferring the deduplication
patch.

Thanks,
Vinicius
