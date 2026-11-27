Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743608;
	b=KTugXxXSUO0hdG2mAQ9ZNoGtt9AKvjnnXZxCnnUl277typu7T6cRQtITyjhJDBbbb197
	 +Fja9eqc78jMQTWZVc6SajhYy44qjc8SAmkdH5y0XYD/0rJ3Hy2hw4T2TDB7NqeNbo8QO
	 uY/1ceupgtlm5YpClRi9fVZNJPWI5SRwb09BnCMu5yISEnH1WUafMXHO0bzCNSaF0Dj2D
	 a0gPNYZfcudOztFjlkCvV+dQAfTXhg7DtvYxFSX0cMclOCCELkVvLcp0uS7hW4RLFzcAt
	 8AYZT6SfGMhnYnAiXO/OhN9Dyr02C9UndO3Hd1vlvGvOe5bh7pXPQNUaqhzEeGElJ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+gOTaJ3/YYOINj2SCbQAYRKbJGCCU6VZJvNJ9mbEYR0=;
	b=ACDFdz+inWHIj2H5HIb/0X5ZepSmnEduW0V/Tyfyd/v052bArdD2UN/gFX2uIRqv693V
	 akk2SdC9/kplvYQ0am4RSboKE/yoEBozP+1M8LOybKRx96UATN1AIORjCxNImDfd0CJUF
	 Nkv7SIv4y3OV2juQFCFprikv+PwZsz4nYUSK4Q4LtYE8nmpapCRw1gohEoQ84SSDP9ARg
	 LhvtGorFVvpGLMndYVnAnxJPG77VMjqAhJ9jR90hZ+w3tDL7yr5GeYWQ0nbbz4HC31HS8
	 PaettwuHgZZGW9hGG4PjQ6bCBr/a1JknzjVyL0fADcsxcAuQhmeEFPQbVI4syihbmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzH6Gik3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C559606A31C;
	Fri, 27 Nov 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzH6Gik3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57881F000C1;
	Fri, 27 Nov 2026 01:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795743608;
	bh=+gOTaJ3/YYOINj2SCbQAYRKbJGCCU6VZJvNJ9mbEYR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XzH6Gik3k0XX8W+OrgXPz/XNIunpoNi/sgpkg+Bn63UVhYrBqJmWep8f/RimspOT+
	 GFjPhOw/eUY0PDTfbf7F6obxobv/0n4ovxaJpX6p3CFem52ccr7ivAevuCbYfjDMZs
	 OT/iFCvLjF86+xGZeU8GLuEa5mMI9C7JbtmRwQCT9NqtAKGD6BgCNMVnedUXpFkKl7
	 sAjul7ol2sDFTA9b3m40yVl79mHjZWfC0GuAl0SD9TnhNvBgKv73cslb6W15p3srl9
	 PpBrIh72IEcmxz3HmEZM2r9LnABCgjXXcOkkVV6yKth2HyfLx4xzJ2bemHC82fuS5I
	 mEVF3XiOW2fuQ==
Message-ID: <sashiko-outbox-236400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] iio: adc: Add the Miyoo A30 analog stick MCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain TISSERAND" <romain.tisserand@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127012612.1589039-3-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
 <20261127012612.1589039-3-romain.tisserand@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 01:40:07 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] iio: adc: unlocked buffer push in a30_stick_receive() races
  with update
- [Medium] iio: adc: missing vdd-supply regulator enablement in
  a30_stick_probe()
- [Medium] iio: adc: premature IIO device registration in
  a30_stick_probe()
- [Medium] iio: adc: broken frame resynchronization on error in
  a30_stick_receive()
--

commit a72f188bfdce946d5cc6f759b74732e22612ab52
Author: Romain TISSERAND <romain.tisserand@gmail.com>

iio: adc: Add the Miyoo A30 analog stick MCU

This commit adds an IIO ADC serdev driver for the Miyoo A30 analog stick
microcontroller, exposing the X and Y axes through direct raw reads and a
kfifo buffer.

> diff --git a/drivers/iio/adc/miyoo-a30-stick.c b/drivers/iio/adc/miyoo-a3=
0-stick.c
> new file mode 100644
> index 0000000000000..d83761558ee75
> --- /dev/null
> +++ b/drivers/iio/adc/miyoo-a30-stick.c
> @@ -0,0 +1,204 @@

[ ... ]

> +static size_t a30_stick_receive(struct serdev_device *serdev, const u8 *=
data,
> +				size_t count)
> +{
> +	struct a30_stick *st =3D serdev_device_get_drvdata(serdev);
> +	size_t i;
> +
> +	for (i =3D 0; i < count; i++) {
> +		/* resynchronise on the start byte */
> +		if (!st->len && data[i] !=3D A30_STICK_START)
> +			continue;
> +
> +		st->frame[st->len++] =3D data[i];
> +		if (st->len < A30_STICK_FRAME_LEN)
> +			continue;
> +
> +		st->len =3D 0;
> +		if (st->frame[A30_STICK_FRAME_LEN - 1] !=3D A30_STICK_END)
> +			continue;

[Severity: Medium]
Does resetting st->len =3D 0 on a bad end byte discard the real start byte =
of
the next frame already buffered in st->frame[1..5]?

Because the MCU streams continuously from power-up, opening the UART mid-fr=
ame
can latch onto a payload byte equal to 0xff (for example, when an axis is at
full deflection 0xff).  Consuming 6 bytes and resetting st->len =3D 0 disca=
rds
the real 0xff start byte inside st->frame and leaves the parser at the exact
same payload offset for the next 6-byte frame, dropping every frame for as
long as that axis stays at 0xff.

Scanning st->frame[1..5] for the next A30_STICK_START and shifting the
remaining bytes to the front of st->frame would allow the parser to
resynchronize within a single frame.

> +
> +		scoped_guard(spinlock, &st->lock) {
> +			st->val[0] =3D st->frame[3];
> +			st->val[1] =3D st->frame[4];
> +			st->valid =3D true;
> +		}
> +
> +		if (iio_buffer_enabled(st->indio_dev)) {
> +			IIO_DECLARE_BUFFER_WITH_TS(u8, scan, 2) =3D { };
> +
> +			scan[0] =3D st->frame[3];
> +			scan[1] =3D st->frame[4];
> +			iio_push_to_buffers_with_ts(st->indio_dev, scan,
> +						    sizeof(scan),
> +						    iio_get_time_ns(st->indio_dev));
> +		}
> +	}
> +
> +	return count;
> +}

[Severity: High]
Can checking iio_buffer_enabled() and calling iio_push_to_buffers_with_ts()
without claiming buffer mode race with __iio_update_buffers()?

The UART stream is never stopped across buffer state transitions, so
a30_stick_receive() runs asynchronously in the TTY flip-buffer workqueue
while a consumer (such as adc_joystick_open() or sysfs buffer0/enable)
enables, reconfigures, or disables buffers under iio_dev_opaque->mlock:

CPU0                                  CPU1 (kworker)
__iio_update_buffers()
  iio_enable_buffers()
    iio_dev_opaque->currentmode =3D ...
    iio_update_demux()
      iio_buffer_update_demux()
        kfree(buffer->demux_bounce);
        buffer->demux_bounce =3D NULL;
        iio_buffer_add_demux()
                                      a30_stick_receive()
                                        if (iio_buffer_enabled(...))
                                          iio_push_to_buffers_with_ts()
                                            ...
                                              iio_demux()
                                                memcpy(buffer->demux_bounce=
 + ..., ...)
                                                <-- NULL pointer dereference
        buffer->demux_bounce =3D kzalloc(...);

When buffers are being disabled or reconfigured, the unlocked push also rac=
es
with iio_buffer_deactivate() modifying iio_dev_opaque->buffer_list and drop=
ping
the buffer reference, and with iio_request_update_kfifo() freeing and
reallocating the kfifo.

Wrapping the push in iio_device_try_claim_buffer_mode() and
iio_device_release_buffer_mode() serializes it against buffer transitions.

[ ... ]

> +static int a30_stick_probe(struct serdev_device *serdev)
> +{
> +	struct device *dev =3D &serdev->dev;
> +	struct iio_dev *indio_dev;
> +	struct a30_stick *st;
> +	unsigned int baud;
> +	int ret;
> +
> +	indio_dev =3D devm_iio_device_alloc(dev, sizeof(*st));
> +	if (!indio_dev)
> +		return -ENOMEM;

[Severity: Medium]
Should a30_stick_probe() enable the "vdd" supply with
devm_regulator_get_enable(dev, "vdd")?

The miyoo,a30-stick devicetree binding defines vdd-supply, and without
enabling it here the MCU can remain unpowered or have its rail turned off by
regulator_late_cleanup(), leaving all reads returning -EAGAIN.

[ ... ]

> +	ret =3D devm_iio_kfifo_buffer_setup(dev, indio_dev, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Open the UART last, so that it is closed first on removal: no frame
> +	 * is pushed to the buffer once the IIO device is going away. Reads
> +	 * return -EAGAIN until the first frame.
> +	 */
> +	serdev_device_set_drvdata(serdev, st);
> +	serdev_device_set_client_ops(serdev, &a30_stick_serdev_ops);
> +
> +	ret =3D devm_serdev_device_open(dev, serdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "cannot open the UART\n");
> +
> +	baud =3D serdev_device_set_baudrate(serdev, A30_STICK_BAUD);
> +	if (baud !=3D A30_STICK_BAUD)
> +		return dev_err_probe(dev, -EINVAL, "cannot set %u baud (got %u)\n",
> +				     A30_STICK_BAUD, baud);
> +
> +	serdev_device_set_flow_control(serdev, false);
> +	ret =3D serdev_device_set_parity(serdev, SERDEV_PARITY_NONE);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "cannot set the parity\n");

[Severity: Medium]
Does calling devm_iio_device_register() before opening and configuring the
UART expose the IIO device to consumers before the transport is ready?

If devm_serdev_device_open() (for example on -EPROBE_DEFER),
serdev_device_set_baudrate(), or serdev_device_set_parity() fails, consumers
such as adc-joystick or userspace can bind to an IIO device that is
immediately torn down, and opening the port while the IIO device is already
live starts reception with default line settings before baudrate, flow
control, and parity are configured.

Once a30_stick_receive() uses iio_device_try_claim_buffer_mode(),
iio_device_unregister() disables all buffers under mlock on removal, so the
UART can be opened and configured before devm_iio_device_register().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127012612.1589=
039-1-romain.tisserand@gmail.com?part=3D2
