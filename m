Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440405;
	b=cg+diJN1Yd4jiROcQORaStAGhWHfXfRkoLAm5i5dGv4KArzJBEwzPuJBWvjqV0nDpeQw
	 bgN8EVSDBpRKWQPH/ohlt4XWUEj5EDksDfnA8g0ijHpc1xXsmoYbmEcyiVNEbQTbPveyQ
	 ONnji1BMyK/+EN6OqYJxhwDGAJYjeHixIvUic5r26uTg6uF9ven+b6J5Va+rVb1ufUpCt
	 3704c/9jjDLE8ws74UmRpNGVJYFNxou95tmMwdOT8xsaMX9qKpEXCXR/QiiyXeeYtvqqJ
	 r7/BM3DWDJvEixEBN6rN7GD+fuM8G6+4o4SPgg5v3f8j6EXmM7hvc5bigUU2xwRbdPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=frV23sLLMWKOP7RPngYOwxGFd6AYAuODJoFiW6amCkw=;
	b=sipT5V8FU9qbXZhBCPyDxJ5Nb6AzBtb7ky4GTUQEIcDQjrnu7p09DZYkVu9ViFWG3q31
	 I/xaSdnJwTner2X0LN+RfKVHiI7LZzthkmHL4mnAoMeCqGXinmOj21+Y/yqeGuEEoMEKN
	 zcZIpKQmKLHDSIIq/s9ZUuPqLHONw0P3rKIgwXh0BgMnU3Wj7vTCxK3twEFvlhb7ijupZ
	 p9pIJ3QZcugMCivAnTWMjQ6BSKKxKVZBBknnHt6MhNxtXMQzz5vbwIig2itng2ijdU2LG
	 4LlklCRRjdX/PyHAGQPUKKHM1rLXSWG8a8NkupJpqUMpvHA0tXIPb/IauWG4oUG6CXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dsTSSl/a";
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEDD606A31C
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBEDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dsTSSl/a
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaa1b5b84aso45482e0c.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440404; x=1793045204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frV23sLLMWKOP7RPngYOwxGFd6AYAuODJoFiW6amCkw=;
        b=dsTSSl/ageiTLgSN1q0WZ0FV03PmbNTZmaNzcOcNlB/zAOuLc3HzXgQCwu7Msmtg31
         eEJcLDXd2Td4EuWIXPPNp/NClvvu6hx1QZpl7t14DgLK3N3hCu+E8j4IYFDmaNSmlxE8
         zbxFlEs+pKqdh51rF9G/Kgw0Kgg1KZEuezyMQIIhFJJmRpSH/X9juLGJRf6lf7kk5BLh
         APwYO1akqKrYuCDnx2YQHAewwzDvH94ugqDjL7fUzfxZpKC1CgCa+ptSkV9Ut9wwFPD7
         9nhBNJrNPN56y7T/c2e+4mKSsw4abSCnD4yq3zXXrdosKX5Gg2uAgS8kZ8kT5G2+vQiA
         vg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440404; x=1793045204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frV23sLLMWKOP7RPngYOwxGFd6AYAuODJoFiW6amCkw=;
        b=b25TLZBpTUOVQtE8c0AiOsr+PJMQb8X8PynRRcjpB2cwJM3U9N+C+zHUUBmy82vFzC
         v0niX5QaNpP6rcIAcL00pmPGW8YN1puidnaavTFpSEv14R4ElRmLJD1lxVI54lV0G79d
         yD09oMAQg/sRcdqM6uyVUTY9Fsc0havYWWL3BRM0r4QR47iO/DhIXGqtlpX+FKz4OmGM
         ihwKxF3mncWI0qbaayu05H0RWBbZYQkX4AsqKEutKYJUPIkRFaLV2KGrXAy+mnAX4KPU
         g2e7k5J/Xw9G/jxbTMebyCBmqLuV/Y5zXiTXANDN1vi3bADq2EefVMcX0L6/V68V0MMx
         o0fA==
X-Forwarded-Encrypted: i=1; AKwUvBwg8yIhTUQIPQoxnFW/9dlj37eiRM2dHrJnJ/nZmg39wV+U7EvyXFYtQgbVdaabufTGlbvdfZ1Dj7NU3Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYIUXaiZavPllAQ/4/AuX6UHY6iCMTVADQhJo54kY9ZWsywzrA+a
	dHYV9vQrfPV+2aoHT5Ttq1D1TmlkhG5mrYQl4CplKnGps01xAnTAlyxn
X-Gm-Gg: AYBFou13cxHRhDbeydCB1cCFpoHmF9UlSXxn13mblHlX+ImTHvdhr0BOjWYYNhl4eoo
	FQe7xCJqtkk0ya3yG8HJgcMOyS6ydYIrsrccVeSpxyBMoYAjhIche1OtZz008wUdUZpHbApj1aC
	lZ8PTqUzsMrz/M03+4iN9R9B5YgmKsqwIz05g4eh5wQRVw78FbKWHXjxiDJcTLK42U4ET4lvP1O
	7P4s/KWKGVrPIhlAgzAlIr3LIjDpKNZeNGLuPQ3RTagd5sdej1r5tBD6DZhx+m9/7sd0qAQ9TSw
	Oc7PVz7uu0G1MWRGu7fIZ22QjuuLUVfH/PnV8nWISg2JWg3WFGwu58b2V4FndsoRMVImQR/f7nO
	3k9ASskFbcOAEHccvsYmjaBw8G2tONgp71nuxFxOrbcaOIofdnHA/E0NTy1jfdKj/WdoF+E4HGe
	ztrhWW1zl5dGxp+1hpdNG5Sw1wvCV0BugxDnHk2hed5iqXGypE5jQGBLDML7BOAT0QIvEPmvdy3
	mPDItDiJUUtTo/ZfQVdUmAkd5h7rNWctstoitosO6p1f+DU1GHyh5Dm/AaCdoDvANU03SCLJcEo
	j+1gGrA=
X-Received: by 2002:a05:6122:1297:b0:5ea:d2d7:37e4 with SMTP id 71dfb90a1353d-5eadcbbef0emr35405e0c.5.1792440403756;
        Mon, 19 Oct 2026 13:06:43 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:06:43 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 0/4] serial: 8250_dw: Allwinner A733 UART support
Date: Mon, 19 Oct 2026 17:06:09 -0300
Message-ID: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While testing the A733 UART, the console stopped taking interrupts at
the first termios change from userspace. Termios changes during console
output could also corrupt characters even when the baud rate did not
change.

Patch 1 is an independent fix for the DesignWare 8250 divisor path.
When DLF is detected, dw8250_setup_port() can replace the BUSY-safe
divisor hook with one that does not provide that protection. If the LCR
write is then dropped while the UART is busy, the retry path can try to
restore IER while DLAB is still selected, causing the value to be
written to DLH instead of IER.

Patch 2 takes Andre's suggestion to only accept a DLF readback when it
is a contiguous 2^n - 1 mask. On the A733, offset 0xc0 is the RS485
control register and reads back 0x19f; Andre observed 0x9f on the A523.

Patches 3 and 4 add the A733 compatible and select SKIP_SET_RATE for
it. Stopping the UART clock from set_termios while TX is active corrupts
output on this board. Skipping redundant reclocking in general was tried
in e5d6bd25f93d and reverted by 7dfae6cbadc1 after regressions on Bay
Trail and Cherry Trail, so the change stays specific to the A733.

Tested on a Radxa Cubie A7Z (PCB V1.11, 1 GiB) on top of tty-next
1184f87e2790e8af9be3116f608d2e86b4792d7d, using local A733 DT and
clock changes that are not part of this series.

With patch 1 alone and the generic fallback, repeated termios changes
no longer stalled the console and hardware IER remained equal to
up->ier, while the false DLF was still detected (dlf_size=9).

With the complete series and the A733 compatible, three clean runs of
both the CLOCAL and CSTOPB stress tests completed without corrupted
output. dlf_size remained 0 and offset 0xc0 remained 0 after the tests.
dlf_size and up->ier were read through a temporary debugfs test patch
which is not part of this series.

I do not have hardware with a real DLF, or Bay Trail/Cherry Trail, to
test those paths.

Changes in v2:
- rework patch 1 around a dwlib divisor helper and preserve an existing
  set_divisor hook, following Ilpo's review
- add a separate check for contiguous DLF readback, following Andre's
  suggestion
- drop the A733-specific NO_DLF quirk
- keep the generic DT fallback
- keep only SKIP_SET_RATE in the A733 platform data
- retain Conor's Acked-by on the binding
- rebase and retest on tty-next 1184f87e2790

Link to v1:
https://lore.kernel.org/all/20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com/

Vinicius Pedrosa (4):
  serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
  serial: 8250_dw: Only accept a contiguous DLF readback
  dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
  serial: 8250_dw: Add Allwinner A733 UART

 .../bindings/serial/snps-dw-apb-uart.yaml     |  1 +
 drivers/tty/serial/8250/8250_dw.c             |  3 +++
 drivers/tty/serial/8250/8250_dwlib.c          | 22 ++++++++++++++++---
 drivers/tty/serial/8250/8250_dwlib.h          |  1 +
 4 files changed, 24 insertions(+), 3 deletions(-)


base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
