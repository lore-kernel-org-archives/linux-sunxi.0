Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399629;
	b=TcJVcfcjQE0LNvCXf26g1nW/kXtMPkeyU1oFyW1fZeqKExy5GaHXvLQlrjVoQ77TzlOa
	 HGKZIRdjypjOt1zPWwSweajx8gNhUevOtyei2Qoi4RQsbaRPvNktHSQ5A0siaYKQX+yas
	 5eAeMWRcuFHdNIe8rRqtttmnvfckYwhQ9Foh42j6JplKfS+0Kbc/qLqd+n4e2gAnsfrXZ
	 7GRXuDnxdePsicsCRFAtRfbbhhfJetkaXvagX8MXrr+MppIfVXfV7mOeDXcra0TROaO+t
	 Pn2T7qvw5kIamuWExCKPHqYCXSz7GY2w1vPqH6SrFwO5ne5qrPSFCYpfLQ4p/PeKWGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
	b=gLJ2l/+1j98l50iCUJ37kH9naSszCuRXagqTE0qxrUHMWc1MYWBLq4pd42UWlZMU+Grf
	 rYz0/tfUmCz8CpE7XIvDLA+nnuQ6xRR6Z+UI9obwfLAkdG3tPU/sSOYhRr8oSmLEAd1cL
	 UgHT3CwdoO7k0pT9JvyOOJ/EcmW0ckO+iF1F2blsKH8btmIcRniOoxZOGVFjj2UqCVBRH
	 /RanHPr6sgX84ZOyUE+B8Rj/oEGnbiSKm860or5V/bhnfCrQbw1gzmT3uPGljvsb9eA+o
	 U1smyi6oKEHBoGVgMLYtgAhlN6rAXtCba4tYSvCtnHmsk9NpQKQMjnSW/MFntWTI04A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qdy0Bnbj;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97937606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 12:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97937606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qdy0Bnbj
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b30477a320so24203027b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399627; x=1795004427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=qdy0Bnbj+3n0z0LD9Ei+DsmRWSJhmhZ6PK8BS/WOo/G+MkXWg55OgNfUdtJCxXD5pA
         8rUgkUKXDOvxy3ZkwzzTs7MWH5HcVR8X6Tp3yn+7C74iu1jd5M8lfIMt+YFjIF7eeQZs
         CHq977/q6oqXzU0d6N+MEaFHMTMXQYd2MMcNTVE1AqdQDMa7gJFnOwttO5beRs0Gx/db
         e6NtAwA8eFEThFAWd5m2h2asXwdHWQ1EvI62Su8TNx5AYNRb5eGW+65H7uhTbQX2t4a3
         xe3xnJrbEA3+End7XWhXkA2GQ2MNjmCX4azRknEcjNRZJk7CC51GfmrKXKp4/GwKi2Cb
         +LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399627; x=1795004427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=EtJkl5NiURlnWTHuuxEdPrvArDa0j4YuoKzOXW5km7KKUfSDYpKuYfx4YgOK6TsKem
         P34lhkgahxz9KCHwALu1WQL8ZtHMJl6gbwZxymOV5s/IyvoEB0iWzUbJm/labhKrmuVO
         Ba99p0P2G+OJJ2elhz5SM3wA0cSUidqzSHDbAfS/omHg4JiKtvB3HVJdFg3QXtNKOVru
         ZEJS7p+QVg8st9YV4jJqXaOcu2WhumUwH4Cq+tYZSIHi2oAZwrgs6d9Pyu8wNaNzviCE
         BftVq14EFmVXho1qYBXP0eD7rOS5bp/eUJF8ivinCEhzh4JrksXO5RdLZcKjNC3h+UQ4
         QJkA==
X-Forwarded-Encrypted: i=1; AL+hErES6CxnPZoe0HjUxs0pcZ/vJV54Aa+XbuWqxcsbkK+IwtniPeXlwS3wd1sUaOl5CsVVYYz2Ek5MSssfWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+GEcUu6s94CbZdXy0HvS9/DF1gYyb68y/SbpSsPt0bQXdJ50hD
	TBPYyZvpEXfMzl+QtXBhgH0HCmNmrryKt5E2JF8sAiiIeIt20Y9qdOxo
X-Gm-Gg: AYBFou2GVuwA53KBpgp/4KvbTs7ZuNTQSkLlkN7q+10LIS0w9iuD/Z0REAxOYBqq/zc
	BJFNjgf4hUithnnUN4En3TRkzKbJ6EgfTXrazxl5ZkTsrBYwDh2ss+h5Eb3kGObUC06sswHV/ja
	siUUr+uYaNBaqs67peW/vB2idI6KQ3MFRa1rcX0L0TZwQ/sfUzm594OTUhkzsCmItTG3KKGxiPx
	D0yXydt1+rVQ0S5FGjAJe5mHRmd9IlXiNMP3cE+IB1kCNrfgrCcgJVVjx/t0o1wDGYvs7GynKw+
	UcanxYP68se2UmlCznQUaJvNRPqNmDOsXHcGGKx5lYWfhL+nCYIkbrns98MpHuTFfSTx+17evAH
	elpyRO+Rmc890Wed3m3v95cqxahmV9X5yuSWB+Is7e9+RU1ftB8fQW3qOvesb8phOnS9rstfNDx
	fegF9MkGF+BJTz9jX/sWpe3ppFyD82vWu1fSIVLB6pAw8A6ZssT9n5oNwha11RzAf+E+5At4w6N
	qXiYNrR+oX+4riOoCNrEmz3VRudgnG+rLgD4Vshy3QVuIdSe8FzjkDDQCzP1DBNp0/qVm5AnP5M
	AjVdgRkLSemKkhEdT5ipgbVtg+dupfE5q21BfJhGdOWjcop0FhwUwYI3DN5iQP/k3Fsx00//Db7
	M/mBMGxEG355lZLFLxBz7jzbzN8eKyWwsRnXj7XVHY+cNcqidjyvI7Az6Tp7trPDtAhbfCDeCWh
	3L0pezaf3+adTNz2V9yMkE
X-Received: by 2002:a05:690c:a849:20b0:8b3:344a:4f44 with SMTP id 00721157ae682-8b3a817a55cmr9874957b3.62.1794399627423;
        Wed, 11 Nov 2026 04:20:27 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm42716417b3.14.2026.11.11.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:20:26 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Wed, 11 Nov 2026 09:20:12 -0300
Message-ID: <20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109-a733-pinctrl-v3@gmail.com>
References: <20261109-a733-pinctrl-v3@gmail.com>
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

On 11/9/26 21:11, Enzo Adriano wrote:
> Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
> POW_MOD_SEL at controller init and skip per-pin voltage setup.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

Tested with the posted prerequisites and my local board DT. POW_MOD_SEL
reads back 0x05555555 on the main PIO and 0x00055555 on R-PIO, and
UART0, MMC0 at 3.3 V, R-I2C0/PMIC and GPIO interrupts on eight main PIO
banks worked.
